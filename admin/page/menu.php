<?php
/**
 * Page class
 */
class page_menu extends Page
{
    public $title='Menu Editing';

    function init(){
        parent::init();
        $cc = $this->add('Columns');
        $this->app->stickyGET('menu_id');
        $this->cr = $cc->addColumn(8)->add('CRUD');
        $c = $cc->addColumn(4);

        $c->add('View_Hint')->set('Navigate and edit the main menu of your site here. Menu items '.
            'are designed to span across 2 pages, so use enter when specifying item names. ');

        $c->add('View_Hint')->set('"Page" needs to point to a valid page. You can also use external URL in here. '.
            'You can create new page in "Pages" section');
    }

    function page_index(){
        $cr = $this->cr;
        $this->setModel($this->cr->setModel('Menu','editable',['name_en','page','menu_cnt']));
        $this->model->addCondition('parent_id',null);
        $this->cr->grid->addColumn('link','name_en',['page'=>'./sub','descr'=>'Name En','id_field'=>'menu_id']);
        if($cr->isEditing()){
            $cr->form->getElement('name_en')->setAttr('rows',2);
            $cr->form->getElement('name_lv')->setAttr('rows',2);
            $cr->form->getElement('name_ru')->setAttr('rows',2);
        }
    }
    function page_sub()
    {
        $cr = $this->cr;
        $m=$this->add('Model_Menu')->load($this->app->stickyGET('menu_id'));
        $this->addCrumbReverse($m['name_en']);
        $this->setModel($this->cr->setModel('Menu','editable',['name_en','page','menu_cnt']));
        $this->model->addCondition('parent_id',$m->id);
    }
}
