<?php
/**
 * Model implementation
 */
class Model_Actions extends SQL_Model
{
    public $table="actions";

    /**
     * init model
     *
     * @return void
     */
    function init()
    {
        parent::init();

        $this->addField('');

    }
}
