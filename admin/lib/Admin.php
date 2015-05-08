<?php

use atk4\atk4homepage\Trait_LanguageSupport;

class Admin extends App_Frontend {

    use Trait_LanguageSupport;

    public $menu;
    public $environment = 'admin';
    function init() {
        parent::init();
        $this->dbConnect();
        $this->add('jUI');

        $this->pathfinder->addLocation(array(
            'addons'=>array('../atk4-addons'/*,'../addons'*/,'../vendor'),
            'php'=>array('../shared','../shared/lib'),
            'mail'=>array('templates/mail'),
        ))->setBasePath('.');

        // auth
        $this->add('Auth')
			->usePasswordEncryption()
            ->setModel('User', 'email', 'password')
		;
		$this->auth->check();

        $this->template->trySet('css','compact.css');

        if(substr($this->page,0,4) == 'page'){
            $this->layout = $this->add('Layout_Fluid',null,null,['layout/wideSidebar']);
        }else{
            $this->layout = $this->add('Layout_Fluid',null,null,['layout/wide']);
        }

        $menu = $this->layout->add('Menu',null,'Main_Menu')->addClass('atk-move-right');
        $menu->addItem(array('Menu', 'icon'=>'menu-1'),'menu');
        $menu->addItem(array('Pages', 'icon'=>'pencil'),'page');
        $menu->addItem(array('Actions', 'icon'=>'megaphone-1'),'actions');
        $menu->addItem(array('Dictionary', 'icon'=>'book'),'dictionary');
        $menu->addItem(array('Users', 'icon'=>'users-1'),'user');
        $menu->addItem(array('About', 'icon'=>'help-1'),'about');
	}
}
