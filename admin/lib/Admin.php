<?php
class Admin extends App_Admin {
    function init() {

        $this->pathfinder->base_location->defineContents(array(
              'addons'=>array('../vendor'),
              'php'=>array('../shared'),
              'content'=>'content'
        ));

        parent::init();

        $this->dbConnect();
		// auth
        $this->add('Auth')
			->usePasswordEncryption()
            ->setModel('User', 'email', 'password')
		;
		$this->auth->check();
	}
}
