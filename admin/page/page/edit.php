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
        $this->title = $this->page['title'];

        $this->showParents();
        $this->editSubPages();
        $this->editContent();
    }

    private function showParents(){
        $page = $this->page;
        $parents = [];
        while($id = $page['page_id']){
            $page = $this->add('Model_Page')->load($id);//TODO Is it save?
            $parents[] = $page;
        }
        krsort($parents);

        if(count($parents)){
            $v = $this->add('ButtonSet');
            $v->add('View')->setElement('span')->set('Go to parent pages: ');
            foreach($parents as $parent_page){
                $v->addButton($parent_page['title'])
                    ->js('click')
                    ->redirect($this->app->url('page/edit',['page_id'=>$parent_page['id']]));
                $v->add('View')->setElement('span')->set('>');
            }
            $v->add('View')->setElement('button')->addClass('atk-button atk-swatch-gray')->set($this->page['title'])->setAttr('disabled','disabled');
        }
    }

    private function editContent(){
        if(!$this->page['has_content']) return;
        $this->add('H2')->set('Edit content');

        $view = $this->add('Controller_PageConstructor_Factory')->getByType($this,$this->page['type'],'admin');
        $view->setModel($this->page);
        $view->get();

    }
    private function addConfigureButton(CRUD $c){
        if($c->grid){
            $c->grid->addColumn('button','configure');
        }

        if($id = $_GET['configure']){
            $this->js()->redirect($this->app->url('page/edit',['page_id'=>$id]))->execute();
        }
    }
    private function editSubPages(){
        if(!$this->page['has_sub_pages']) return;

        $this->add('H2')->set('Configure sub pages');

        $model_page = $this->add('Model_Page')->addCondition('page_id',$this->page->id)->addCondition('menu_type','sub');

        $c = $this->add('CRUD');
        $c->setModel($model_page,
            Model_Page::$edit_in_form,
            Model_Page::$show_in_grid
        );

        $this->addConfigureButton($c);
    }
}