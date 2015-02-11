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

        $this->addMenu();
        $this->addRouter();
    }

    private function addRouter(){
        //Route dynamic pages
        $this->real_page = $this->page;
        $this->add('Controller_PatternRouter');

        $get_pages = $this->getTopPages();
        $pages = '';
        foreach($get_pages as $page){
            $pages .= $page['hash_url'].'|';
        }
        $pages = substr($pages, 0, strlen($pages)-1);
        if($pages){
            $this->router->addRule('('.$pages.')(\/{0,1})','dynamic-page',array('page-name'));
        }
        $this->router->route();
    }
    private function addMenu(){
        $menu = $this->layout->add('Menu_Vertical',null,'Main_Menu');
        foreach($this->getTopPages() as $page){
            $this->addMenuItem($menu,$page['title'],'home-1','atk-swatch-beigeDarken',$page['hash_url']);
        }
    }
    function addMenuItem($menu,$title,$icon,$class,$url=null){
        if ($this->isCurrent(strtolower($title))) $active_class='ui-state-active'; else $active_class='';
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
        return $href==$this->api->page||$href==';'.$this->api->page||$href.$this->api->getConfig('url_postfix','')==$this->api->page||(string)$href==(string)$this->api->url();
    }
    private $top_pages=null;
    function getTopPages(){
        if(!$this->top_pages){
            $this->top_pages = $this->add('Model_Page')->getTop()->getRows();
        }
        return $this->top_pages;
    }
}