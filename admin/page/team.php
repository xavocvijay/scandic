<?php
/**
 * Page class
 */
class page_team extends Page
{
    public $title='Team';

    function init()
    {
        parent::init();

        $cc = $this->add('Columns');
        $this->app->stickyGET('menu_id');
        $this->cr = $cc->addColumn(8)->add('CRUD');
        $this->cr->setModel('Team','editable',['name_en','position_en','photo','ord']);
        $c = $cc->addColumn(4);

        $c->add('View_Hint')->set('To add a new team member you will manually need to add a picture to the site inside '.
            'folder frontend/public/images/team/');

        $c->add('View_Hint')->set('Drag and drop lines above to reorder pages.')->addClass('atk-push');

        $this->js()->_load('atk4HomePage');

        $this->js(true)->atk4HomePage()->makeSortable($this->cr->getJSID(),"tbody>tr",'data-id',$this->app->url());

        $this->updateOrder($this->cr, $this->cr->model);

/*
        $this->add('Button')->addClass('atk-push')->set('Save order')->js('click')->atk4HomePage()->saveOrder(
            $this->cr->name,"tbody>tr",'data-id',$this->app->url()
        );
        */

    }
    protected function updateOrder(\AbstractView $view, Model $m) {

        if ($_GET['action'] == 'refresh_order') {
            $ids = $_GET['ids'];
            $ids_arr = [];
            foreach (explode(',',$ids) as $k=>$v) {
                $ids_arr[$v] = $k;
            }
            $m->addCondition('id','in',$ids);

            foreach ($m as $row) {
                $row->set('ord',$ids_arr[$row->id])->saveAndUnload();
            }
            $this->js()->univ()->successMessage('Order updated')->execute();
        }
    }

}
