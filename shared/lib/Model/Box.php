<?php
/**
 * Model implementation
 */
class Model_Box extends SQL_Model
{
    public $table="box";

    /**
     * init model
     *
     * @return void
     */
    function init()
    {
        parent::init();

        $this->addField('name');
        $this->hasOne('Page');
        $this->addField('position')->enum(['left','right'])
        ->hint('Enter text as bullet-points.');
        $this->addField('content')
        ->type('text')
        ->display(['form'=>'atk4\markdown\Form_Field_Markdown'])
        ;
    }
}
