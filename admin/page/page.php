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
        $this->updateOrder($c,$m);
        $c->setModel($m,
            Model_Page::$edit_in_form,
            Model_Page::$show_in_grid
        );
        $this->addConfigureButton($c);

        $this->js(true)->tdash()->makeSortable($c->name,"tbody>tr");

        $this->add('Button')->set('Save order')->js('click')->tdash()->saveOrder(
            $c->name,"tbody>tr",'data-id',$this->app->url()
        );

    }
    private function addConfigureButton(CRUD $c){
        if($c->grid){
            $c->grid->addColumn('button','configure');
        }

        if($id = $_GET['configure']){
            $this->js()->redirect($this->app->url('./edit',['page_id'=>$id]))->execute();
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