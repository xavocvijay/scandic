<?php
class Frontend extends App_Frontend {

    use atk4\atk4homepage\Trait_LanguageSupport;
    use atk4\atk4homepage\Trait_ATK4HomePage;

    public $environment = 'prod';
    function init(){
        parent::init();
        $this->dbConnect();
        $this->add('jUI');

        $this->pathfinder->addLocation(array(
            'addons'=>array('../atk4-addons','../addons','../vendor','../vendor/atk4'),
            'php'=>array('../shared','../shared/lib'),
            'mail'=>array('templates/mail'),
            'js'=>array(
                '../shared/js',
            ),
        ))->setBasePath('.');

        $this->pathfinder->addLocation(array(
            'js'=>array(
                'packages',
            ),
            'css'=>array('packages'),
        ))
            ->setBasePath(getcwd().'/public')
            ->setBaseUrl($this->getBaseURL())
        ;

        $this->editor_session = $this->add('atk4\atk4homepage\Controller_SessionControl');

        $this->layout = $this->add('Layout_Fluid');

//        $this->addRouter();
        $this->real_page = $this->page;
        $this->addMenu();
        $this->addLanguageSwitcher();
    }

    private function addLanguageSwitcher(){
        $langs = $this->app->getConfig('atk4-home-page/available_languages');
        $button_set = $this->layout->add('ButtonSet',null,'langs');
        foreach($langs as $key=>$lang){
            $button = $button_set->addButton($key)->addClass('atk-button-small');
            if($key == $this->getCurrentLanguage()){
                $button->setAttr('disabled','disabled')->addClass('atk-swatch-blue');
            }
            $button->js('click')->univ()->ajaxec($this->app->url($this->real_page,['language'=>$key]));
        }
        if($_GET['language']){
            $this->setCurrentLanguage($_GET['language']);
            $this->js()->redirect($this->url($_GET['page']))->execute();
        }
    }

    public $real_page;
    private function addRouter(){
        try{
            $this->locatePath('page',str_replace('_','/',$this->page).'.php');
        }catch (Exception_PathFinder $e){
            //Route dynamic pages
            $this->real_page = $this->page;
            $this->add('Controller_PatternRouter');
            $this->router->addRule('([a-zA-Z0-9-])','dynamic-page',array('page-name'));
            $this->router->route();
        }
    }


    private function addMenu(){
        $menu = $this->layout->add('Menu',null,'Main_Menu');
        $this->addMenuItem($menu,$this->getNameByUrlHash('services'),'home-1','','services');
        $this->addMenuItem($menu,'Industry<br />Solutions','home-1','','shit');
        $this->addMenuItem($menu,'Cross Company<br />Solutions','home-1','','shit');
        $this->addMenuItem($menu,'Technology<br />Stack','home-1','','shit');
        $submenu=$menu->addMenu([$this->getNameByUrlHash('about'),'icon'=>'filter'])->setClass('atk-menu-vertical atk-popover atk-popover-top-right');
        $this->addMenuItem($submenu,$this->getNameByUrlHash('team'),'home-1','atk-swatch-white','team');
    }

    private function getNameByUrlHash($url_hash){
        $m = $this->add('atk4\atk4-homepage\Model_Page');

        $m->tryLoadBy('hash_url',$url_hash);
        if(!$m->loaded()){
            $m->tryLoadBy('name',$url_hash);
        }

        if($m->loaded()){
            return $m->getTranslations()->loadAny()->get('meta_title');
        }
        return false;
    }


    public function addMenuItem($menu,$title,$icon,$class,$url){
        if ($this->isCurrent(strtolower($url))) $active_class='active'; else $active_class='';
        if ($url) {
            $url = $this->url($url);
        } else {
            $url = strtolower($title);
        }
        $menu->addItem($title,$url)->addClass($class.' '.$active_class);
    }


    function isCurrent($href){
        // returns true if item being added is current
        if(!is_object($href))$href=str_replace('/','_',$href);
        return $href==$this->real_page||$href==';'.$this->real_page||$href.$this->getConfig('url_postfix','')==$this->real_page||(string)$href==(string)$this->url();

    }
}