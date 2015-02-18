<?php
class Admin extends App_Frontend {

    use Trait_LanguageSupport;

    public $menu;
    public $environment = 'admin';
    function init() {
        parent::init();
        $this->dbConnect();
        $this->add('jUI');
        $this->jquery->addStaticInclude('scandic');

        $this->pathfinder->addLocation(array(
            'addons'=>array('../atk4-addons','../addons','../vendor'),
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

        $this->layout = $this->add('Layout_Fluid');

        $menu = $this->layout->add('Menu',null,'Main_Menu')->addClass('atk-move-right');
        $menu->addItem(array('CMS', 'icon'=>'download'),'page');
        $menu->addItem(array('Users', 'icon'=>'download'),'user');
	}
}
