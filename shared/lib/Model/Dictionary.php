<?php
/**
 * Model implementation
 */
class Model_Dictionary extends SQL_Model
{
    public $table="dictionary";

    function init()
    {
        parent::init();

        $this->addField('name');

        $this->addField('descr')->type('text')->display(['form'=>'atk4\markdown\Form_Field_Markdown']);

    }
}
