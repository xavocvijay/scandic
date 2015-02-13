<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 10.02.15
 * Time: 11:25
 */
class page_page extends Page{
    function init(){
        parent::init();
        $this->title = 'Pages';

        $m = $this->add('Model_Page')->getTop();
        $m->setOrder('order');

        $c = $this->add('CRUD');
        $c->setModel($m,
            Model_Page::$edit_in_form,
            Model_Page::$show_in_grid
        );
        $this->addConfigureButton($c);

    }
    private function addConfigureButton(CRUD $c){
        if($c->grid){
            $c->grid->addColumn('button','configure');
        }

        if($id = $_GET['configure']){
            $this->js()->redirect($this->app->url('./edit',['page_id'=>$id]))->execute();
        }
    }
}