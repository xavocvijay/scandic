<?php
class Frontend extends ApiFrontend {
    public $environment = 'prod';
    function init(){
        parent::init();
        $this->dbConnect();
        $this->add('jUI');

        $this->pathfinder->addLocation(array(
            'addons'=>array('../atk4-addons','../addons','../vendor'),
            'php'=>array('../shared','../shared/lib'),
            'mail'=>array('templates/mail'),
        ))->setBasePath('.');
    }
}