<?php
class Model_Jobs extends SQL_Model
{
    public $table="jobs";

    function init()
    {
        parent::init();

        $this->addField('name');
        $this->addField('content_left')->type('text')->display(['form'=>'atk4\markdown\Form_Field_Markdown']);
        $this->addField('content_right')->type('text')->display(['form'=>'atk4\markdown\Form_Field_Markdown']);

//        $this->addField('ord')->type('int')->system(true); // order
 //       $this->setOrder('ord,id');
    }
}
