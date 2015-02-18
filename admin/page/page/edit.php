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

        $this->page = $this->add('Model_Page')->joinTranslation()/*->getForCurrentLanguage()*/->load($page_id);
        $this->title = $this->page['name'] . ' ('.($this->page['type']?:'Group of pages').')';


        $col_total = $this->add('View');
        $col_total->js('reload')->reload();

        $this->showLangButtons($col_total);
        $this->showParents($col_total);
        $this->editSubPages($col_total);

        $row = $col_total->add('View')->addClass('atk-row atk-push');
        $col_left = $row->add('View')->addClass('atk-col-6')->add('View')->addClass('atk-box');
        $col_right = $row->add('View')->addClass('atk-col-6')->add('View')->addClass('atk-box');

        $this->addMetaForm($col_left);
        $this->editContent($col_right);

        $this->addHooks();
    }

    private function addHooks(){

    }

    private function showLangButtons(AbstractView $view){
        $this->app->setCurrentLanguage('lv');
        //var_dump($this->app->recall('curr_lang_name'));
        $langs = $this->app->getConfig('atk4-home-page/available_languages');
        $button_set = $view->add('ButtonSet')->addClass('atk-box-small');
        foreach($langs as $key=>$lang){
            $button = $button_set->addButton($key);
            if($key == $this->app->getCurrentLanguage()){
                $button->setAttr('disabled','disabled')->addClass('atk-swatch-gray');
            }
            $button->js('click',[
//                $this->app->setCurrentLanguage($key),
                $view->js()->trigger('reload')
            ]);
        }
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
                $vv->addButton($parent_page['name'])
                    ->js('click')
                    ->redirect($this->app->url('page/edit',['page_id'=>$parent_page['id']]));
                $vv->add('View')->setElement('span')->set('>');
            }
        }
        $vv->add('View')->setElement('button')
            ->addClass('atk-button atk-swatch-gray')
            ->set($this->page['name'])
            ->setAttr('disabled','disabled');
    }

    public function addMetaForm(AbstractView $v=null){
        $this->app->stickyGet('page_id');
        if (!$v) $v = $this;
        $v->add('H2')->set('Edit Page Meta Fields');
        $form = $v->add('Form');
        $form->addClass('stacked');
        $form->setModel($this->page,$this->page->getMetaFields());
        $form->getElement('meta_title')->setCaption('Menu title (localized)');
        $form->addSubmit();

        if($form->isSubmitted()){
            $form->save();

            $form->js()->univ()->successMessage('Saved')->execute();
        }
    }

    private function editSubPages(AbstractView $v=null){
        if (!$v) $v = $this;
        if(!$this->page['type']){
            $v->add('H2')->set('Configure pages of this group');

            $model_page = $this->add('Model_Page')->addCondition('page_id',$this->page->id);

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