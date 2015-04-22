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
        $this->addField('position')->enum(['left','right']);
        $this->addField('content')->type('text')->hint('Enter multiple lines separate by Enter. Each line will become a bullet-point');
    }
}
