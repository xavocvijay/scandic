<?php
class Frontend extends App_Frontend {

    use atk4\atk4homepage\Trait_LanguageSupport;
    //use atk4\atk4homepage\Trait_ATK4HomePage;

    public $title = 'Scandic Fusion';

    public $environment = 'prod';
    function init(){
        parent::init();
        $this->dbConnect();
        $this->add('jUI');
        $this->jui->addStaticInclude('atk-helpers-min');
        $this->jui->addStaticInclude('jquery.easing-1.3');
        $this->jui->addStaticInclude('jquery.royalslider.min');
        $this->jui->addStaticInclude('scandic');

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

 //       $this->addRouter();
        $this->real_page = $this->page;
        $this->addMenu();
        $this->addLanguageSwitcher();
    }

    function loadStaticPage($page){
        $m = $this->add('Model_Page')->tryLoadBy('hash_url',$this->app->pm->page);
        //$ctl->forModel($this->m);

        if(!$m->loaded()){
            return parent::loadStaticPage($page);
        }

        $tpl = $m->ref('template_id');
        $ctl = $this->add('Controller_Template_'.(ucfirst($tpl['sys_name'])));
        $ctl ->forModel($m);

        $template = ['page/'.$tpl['sys_name'].($m['parent_id']?'-inner':'')];

        $p = $this->layout->add('CmsPage',['m'=>$m, 'tpl'=>$tpl, 'ctl'=>$ctl],null,$template);

        return $p;

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

        $m=$this->add('Model_Menu');
        $m->addExpression('name')->set('name_en');
        $m->addCondition('parent_id',null);
        $m->joinPage();
        $m->addCondition('is_public', true);
        $menu ->setModel($m);


        //$menu->addItem('Hello World', 'bleh');
        /*

        $this->addMenuItem($menu,$this->getNameByUrlHash('services'),'home-1','','services');
        $this->addMenuItem($menu,$this->getNameByUrlHash('industry'),'home-1','','industry');
        $this->addMenuItem($menu,$this->getNameByUrlHash('solutions'),'home-1','','solutions');
        $this->addMenuItem($menu,$this->getNameByUrlHash('technology'),'home-1','','technology');
        $submenu=$menu->addMenu([$this->getNameByUrlHash('about'),'icon'=>'filter']);
        $this->addMenuItem($submenu,$this->getNameByUrlHash('aboutus'),'','atk-shape-rounded-top','aboutus');
        $this->addMenuItem($submenu,$this->getNameByUrlHash('team'),'','','team');
        $this->addMenuItem($submenu,$this->getNameByUrlHash('jobs'),'','','jobs');
        $this->addMenuItem($submenu,$this->getNameByUrlHash('contact'),'','atk-shape-rounded-bottom','contact');
        */
    }

    /*
    private function getNameByUrlHash($url_hash){
        // BAD IMPLEMENTATION - unnecessary multiple queries
        $m = $this->add('atk4\atk4-homepage\Model_Page');

        $m->tryLoadBy('hash_url',$url_hash);
        if(!$m->loaded()){
            $m->tryLoadBy('name',$url_hash);
        }

        if($m->loaded()){
            return $m->getTranslations()->loadAny()->get('meta_title');
        }
        return $url_hash;
    }
    */


/*
    public function addMenuItem($menu,$title,$icon,$class,$url){
        if ($this->isCurrent(strtolower($url))) $active_class='active'; else $active_class='';
        if ($url) {
            $url = $this->url($url);
        } else {
            $url = strtolower($title);
        }
        $menu->addItem($title,$url)->addClass($class.' '.$active_class);
    }
    */


    function isCurrent($href){
        // returns true if item being added is current
        if(!is_object($href))$href=str_replace('/','_',$href);
        return $href==$this->real_page||$href==';'.$this->real_page||$href.$this->getConfig('url_postfix','')==$this->real_page||(string)$href==(string)$this->url();

    }
}
