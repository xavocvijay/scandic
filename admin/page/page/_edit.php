<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 10.02.15
 * Time: 11:25
 */
class page_page_edit extends Page{
    protected $page;
    protected $trans;
    function init(){
        parent::init();
        $page_id = $this->app->stickyGet('page_id');


        $this->page = $this->add('Model_Page')->load($page_id);
        $this->trans = $this->page->getTranslation(true);
        $this->title = $this->page['name'] . ' ('.($this->page['type']?:'Group of pages').')';


        $col_total = $this->add('View');

        if($_GET['language']){
            $this->app->setCurrentLanguage($_GET['language']);
            $this->js()->reload()->execute();
        }

        $this->showLangButtons($col_total);
        $this->showParents($col_total);
        $this->editSubPages($col_total);

        $row = $col_total->add('View')->addClass('atk-row atk-push');
        $col_left = $row->add('View')->addClass('atk-col-6')->add('View')->addClass('atk-box');
        $col_right = $row->add('View')->addClass('atk-col-6')->add('View')->addClass('atk-box');

        $this->addMetaForm($col_left);
        $this->editContent($col_right);
    }

    private function showLangButtons(AbstractView $view){

        $langs = $this->app->getConfig('atk4-home-page/available_languages');
        $button_set = $view->add('ButtonSet')->addClass('atk-box-small');
        foreach($langs as $key=>$lang){
            $button = $button_set->addButton($key);
            if($key == $this->app->getCurrentLanguage()){
                $button->setAttr('disabled','disabled')->addClass('atk-swatch-gray');
            }
            $button->js('click')->univ()->ajaxec($this->app->url(null,['language'=>$key]));
        }
    }


    private function showParents(AbstractView $v=null){
        if (!$v) $v = $this;
        $page = $this->page;
        $parents = [];
        while($id = $page['page_id']){
            $page = $this->add('Model_Page')->load($id);//TODO Is it save?
            $page->translation = $page->getTranslation(true);
            $parents[] = $page;
        }
        krsort($parents);

        $vv = $v->add('ButtonSet')->setClass('atk-box atk-jackscrew');
        $vv->add('View')->setElement('span')->set('Breadcrumbs: ');
        if(count($parents)){
            foreach($parents as $parent_page){
                $vv->addButton($parent_page->translation['meta_title'])
                    ->js('click')
                    ->redirect($this->app->url('page/edit',['page_id'=>$parent_page['id']]));
                $vv->add('View')->setElement('span')->set('>');
            }
        }
        $vv->add('View')->setElement('button')
            ->addClass('atk-button atk-swatch-gray')
            ->set($this->trans['meta_title'])
            ->setAttr('disabled','disabled');
    }

    public function addMetaForm(AbstractView $v=null){
        $this->app->stickyGet('page_id');
        if (!$v) $v = $this;

        if($this->page['type']){
            $v->add('H2')->set('Edit Page URL');

            //URL form
            $form = $v->add('Form');
            $form->addClass('stacked');
            $form->setModel($this->page,['hash_url']);
            $form->addSubmit();

            if($form->isSubmitted()){
                $form->save();

                $form->js()->univ()->successMessage('Saved')->execute();
            }
        }

        $v->add('H2')->set('Edit Page Metas');
        //Meta form
        $form2 = $v->add('Form');
        $form2->addClass('stacked');
        $form2->setModel($this->trans,$this->trans->getMetaFields());
        $form2->getElement('meta_title')->setCaption('Menu title (localized)');
        $form2->addSubmit();

        if($form2->isSubmitted()){
            $form2->save();

            $form2->js()->univ()->successMessage('Saved')->execute();
        }
    }

    private function editSubPages(AbstractView $v=null){
        if (!$v) $v = $this;
        if(!$this->page['type']){
            $v->add('H2')->set('Configure pages of this group');

            $model_page = $this->add('Model_Page')->deleted(false)->addCondition('page_id',$this->page->id);

            $c = $v->add('CRUD')->addClass('atk-push');
            $this->updateOrder($c,$model_page);
            $c->setModel($model_page,
                Model_Page::$edit_in_form,
                Model_Page::$show_in_grid
            );

            $this->addConfigureButton($c);

            $v->js(true)->scandic()->makeSortable($c->name,"tbody>tr");

            $v->add('Button')->addClass('atk-push')->set('Save order')->js('click')->scandic()->saveOrder(
                $c->name,"tbody>tr",'data-id',$this->app->url()
            );
        } else {
            $v->add('View')
                ->addClass('atk-box atk-effect-warning')
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

    private function updateOrder(AbstractView $v, Model_Page $m) {

        if ($_GET['action'] == 'refresh_order') {
            $ids = $_GET['ids'];
            $ids_arr = [];
            foreach (explode(',',$ids) as $k=>$v) {
                $ids_arr[$v] = $k;
            }
            $m->addCondition('id','in',$ids);

            foreach ($m as $row) {
                $row->set('order',$ids_arr[$row->id])->saveAndUnload();
            }
            $this->js()->univ()->successMessage('Order updated')->execute();
        }
    }
}