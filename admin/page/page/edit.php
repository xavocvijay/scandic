<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 10.02.15
 * Time: 11:25
 */
class page_page_edit extends Page{
    protected $page;
    function init(){
        parent::init();
        $page_id = $this->app->stickyGet('page_id');

        $this->page = $this->add('Model_Page')->load($page_id);
        $this->title = $this->page['title'] . ' ('.($this->page['type']?:'Group of pages').')';

        $col_total = $this->add('View');
        $this->showParents($col_total);
        $this->editSubPages($col_total);

        $row = $col_total->add('View')->addClass('atk-row atk-push');
        $col_left = $row->add('View')->addClass('atk-col-6')->add('View')->addClass('atk-box');
        $col_right = $row->add('View')->addClass('atk-col-6')->add('View')->addClass('atk-box');

        $this->addMetaForm($col_left);
        $this->editContent($col_right);
    }

    private function showParents(AbstractView $v=null){
        if (!$v) $v = $this;
        $page = $this->page;
        $parents = [];
        while($id = $page['page_id']){
            $page = $this->add('Model_Page')->load($id);//TODO Is it save?
            $parents[] = $page;
        }
        krsort($parents);

        $vv = $v->add('ButtonSet')->setClass('atk-box atk-jackscrew');
        $vv->add('View')->setElement('span')->set('Breadcrumbs: ');
        if(count($parents)){
            foreach($parents as $parent_page){
                $vv->addButton($parent_page['title'])
                    ->js('click')
                    ->redirect($this->app->url('page/edit',['page_id'=>$parent_page['id']]));
                $vv->add('View')->setElement('span')->set('>');
            }
        }
        $vv->add('View')->setElement('button')
            ->addClass('atk-button atk-swatch-gray')
            ->set($this->page['title'])
            ->setAttr('disabled','disabled');
    }

    public function addMetaForm(AbstractView $v=null){
        if (!$v) $v = $this;
        if($this->page['type']){
            $v->add('H2')->set('Edit Page Meta Fields');
            $form = $v->add('Form');
            $form->addClass('stacked');
            $form->setModel($this->page,Model_Page::$meta_fields);
            $form->addSubmit();

            if($form->isSubmitted()){
                $form->save();

                $form->js()->univ()->successMessage('Saved')->execute();
            }
        } else {
            $v->addClass('atk-effect-warning')
                ->add('View')
                ->set('Page group cannot have meta tags');
        }
    }

    private function editSubPages(AbstractView $v=null){
        if (!$v) $v = $this;
        if(!$this->page['type']){
            $v->add('H2')->set('Configure pages of this group');

            $model_page = $this->add('Model_Page')->addCondition('page_id',$this->page->id);

            $c = $v->add('CRUD');
            $c->setModel($model_page,
                Model_Page::$edit_in_form,
                Model_Page::$show_in_grid
            );

            $this->addConfigureButton($c);
        } else {
            $v->add('View')
                ->setClass('atk-box atk-effect-warning')
                ->setStyle('clear','both')
                ->set('Page cannot have sub pages but content');
        }
    }

    private function editContent(AbstractView $v=null){
        if (!$v) $v = $this;
        if($this->page['type']){
            $v->add('H2')->set('Edit page parts');
            $view = $v->add('View_PageConstructor_ATK4HomePage',['template_path'=>$this->page->getTemplatePath(),'app_type'=>'admin']);
            $view->setModel($this->page);
            $view->get();
        } else {
            $v->addClass('atk-effect-warning')
                ->add('View')
                ->set('Page group cannot have content but other pages');
        }

    }
    private function addConfigureButton(CRUD $c){
        if($c->grid){
            $c->grid->addColumn('button','configure');
        }

        if($id = $_GET['configure']){
            $this->js()->redirect($this->app->url('page/edit',['page_id'=>$id]))->execute();
        }
    }
}