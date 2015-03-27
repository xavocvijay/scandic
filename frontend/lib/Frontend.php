<?php
class Frontend extends App_Frontend {

    use atk4\atk4homepage\Trait_LanguageSupport;
    use atk4\atk4homepage\Trait_ATK4HomePage;

    public $environment = 'prod';
    function init(){
        parent::init();
        $this->dbConnect();
        $this->add('jUI');

//        $initiator = new Initiator;
//        $initiator->addLocation($this);

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
        $this->addMenuItem($menu,'Competences<br />and Services','home-1','atk-swatch-white','khjghng');
        $this->addMenuItem($menu,'Industry<br />Solutions','home-1','atk-swatch-white','industrysolutions');
        $this->addMenuItem($menu,'Cross Company<br />Solutions','home-1','atk-swatch-white','industrysolutionsh');
        $this->addMenuItem($menu,'Technology<br />Stack','home-1','atk-swatch-white','industrysolutionsk');
        $submenu=$menu->addMenu(['About Scandic<br />Fusion','icon'=>'filter','swatch'=>'white'])->addClass('atk-swatch-white');
        $this->addMenuItem($submenu,'Our Team','home-1','atk-swatch-white','team');

        /*foreach($this->getTopPages() as $page){
            if(!$page['type']){
                if(!$page->hasChildren()) continue;
            }
            $page->translation = $page->getTranslation(true);
            $url = $page['hash_url']?:$page['url_first_child'];
            $this->addMenuItem($menu,$page->translation['meta_title'],'home-1','atk-swatch-beigeDarken',$url);
        }*/
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


    private $top_pages=null;
    function getTopPages(){
        if(!$this->top_pages){
            $this->top_pages = $this->add('atk4\atk4homepage\Model_Page')->getTop()->getForMenu();//->getRows();
        }
        return $this->top_pages;
    }
}