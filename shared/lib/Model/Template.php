<?php
class Model_Template extends SQL_Model
{
    public $table="template";
    function init()
    {
        parent::init();

        $this->addField('name');
        $this->addField('sys_name');
        $this->hasMany('Page');
    }
}
