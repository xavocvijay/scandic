<?php
/**
 * Model implementation
 */
class Model_About extends SQL_Model
{
    public $table="about";

    /**
     * init model
     *
     * @return void
     */
    function init()
    {
        parent::init();

        $this->addField('year');
        $this->addField('content')->type('text');

    }
}
