<?php
class Model_Setting extends SQL_Model {
    public $table = 'settings';

    function init(){
        parent::init();

        $this->addField('key');
        $this->addField('value');
    }
}