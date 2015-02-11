<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 10.02.15
 * Time: 11:25
 */
class page_settings extends Page{
    function init(){
        parent::init();

        $m = $this->add('Model_Setting');

        $c = $this->add('CRUD');
        $c->setModel($m);
    }
}