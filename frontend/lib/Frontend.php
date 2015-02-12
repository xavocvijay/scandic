<?php
class Frontend extends App_Frontend {
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

        $this->layout = $this->add('Layout_Fluid');

        if($this->page != 'index') $this->addRouter();
        $this->addMenu();
    }

    public $real_page;
    private function addRouter(){
        //Route dynamic pages
        $this->real_page = $this->page;
        $this->add('Controller_PatternRouter');

        $this->router->addRule('([a-zA-Z0-9-])','dynamic-page',array('page-name'));
        $this->router->route();
    }


    private function addMenu(){
        $menu = $this->layout->add('Menu',null,'Main_Menu')->addClass('atk-move-right');
        foreach($this->getTopPages() as $page){
            $this->addMenuItem($menu,$page['title'],'home-1','atk-swatch-beigeDarken',$page['hash_url']);
        }
    }


    public function addMenuItem($menu,$title,$icon,$class,$url){
        if ($this->isCurrent(strtolower($url))) $active_class='ui-state-active'; else $active_class='';
        if ($url) {
            $url = $this->url($url);
        } else {
            $url = strtolower($title);
        }
        $menu->addItem(array($title, 'icon'=>$icon),$url)->addClass($class.' '.$active_class);
    }


    function isCurrent($href){
        // returns true if item being added is current
        if(!is_object($href))$href=str_replace('/','_',$href);
        if(
            $href==$this->real_page
            ||
            $href==';'.$this->real_page
            ||
            $href.$this->api->getConfig('url_postfix','')==$this->real_page
            ||
            (string)$href==(string)$this->api->url()
        ) return true;
        return false;
    }


    private $top_pages=null;
    function getTopPages(){
        if(!$this->top_pages){
            $this->top_pages = $this->add('Model_Page')->getTop()->getRows();
        }
        return $this->top_pages;
    }
}