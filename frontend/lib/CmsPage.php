<?php
class CmsPage extends Page {

    protected $m;
    protected $tpl;

    function init(){
        parent::init();

        foreach($this->m->get() as $key=>$val){
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
        if($this->ctl->hasMethod('forFrontend'))$this->ctl->forFrontend($this);
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

    function defaultTemplate(){
        $this->m = $this->add('Model_Page')->tryLoadBy('hash_url',$this->app->pm->page);

        if(!$this->m->loaded())return parent::defaultTemplate();

        $this->tpl = $this->m->ref('template_id');
        $this->ctl = $this->add('Controller_Template_'.(ucfirst($this->tpl['sys_name'])));
        $this->ctl->forModel($this->m);


        return ['page/'.$this->tpl['sys_name'].($this->m['parent_id']?'-inner':'')];

    }
}
