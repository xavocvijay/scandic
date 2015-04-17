<?php
class CmsPage extends Page {

    protected $m;
    protected $tpl;
    protected $tags=[];

    function init(){
        parent::init();

        $this->applyTags($this->m->get());

        $this->title = $this->m['title'];

        if($this->ctl->hasMethod('forFrontend'))$this->ctl->forFrontend($this);
    }

    function applyTags($tags = []){
        $this->tags = array_merge($this->tags, $tags);
    }

    function _applyTags(){
        foreach($this->tags as $key=>$val){
            if(!$this->template->hasTag($key))continue;
            $filters = $this->template->get($key);
            if(is_array($filters))$filters = array_pop($filters);

            $val = htmlspecialchars($val);

            $filters=explode(',',trim($filters));
            if($filters[0])foreach($filters as $filter){
                $val = $this->{"filter_".$filter}($val);
            }

            $this->template->trySetHTML($key, $val);

        }
    }

    function recursiveRender(){
        $this->_applyTags();
        return parent::recursiveRender();
    }

    function subPageHandler(){
        //var_Dump($this->app->pm->page);

    }

    // Format fields for output
    function filter_br($val){
        return nl2br($val);
    }
    function filter_email($val){
       $regex = '/(\S+@\S+\.\S+)/';
       $replace = '<a href="mailto:$1">$1</a>';
       return preg_replace($regex, $replace, $val);
    }
    function filter_md($val){
        $Parsedown = new Parsedown();
        return $Parsedown->text($val);
    }

    function filter_page_id($val){
        return $this->app->url($this->add('Model_Page')->load($val)['hash_url']);
    }

}
