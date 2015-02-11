<?php
class Admin extends App_Admin {
    public $menu;
    function init() {

        $this->pathfinder->base_location->defineContents(array(
              'addons'=>array('../vendor'),
              'php'=>array('../shared','../shared/lib'),
        ));

        parent::init();

        $this->dbConnect();
		// auth
        $this->add('Auth')
			->usePasswordEncryption()
            ->setModel('User', 'email', 'password')
		;
		$this->auth->check();

        $this->template->trySet('css','compact.css');
//        $this->menu = null;
        $header = $this->layout->addHeader('View');
        $this->menu = $header->add('Menu');
        $this->menu->addItem(array('CMS', 'icon'=>'download'),'page');
        $this->menu->addItem(array('Users', 'icon'=>'download'),'user');
	}
}
