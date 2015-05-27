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

        if($this->template->hasTag('ActionsWithIcons')){
            $this->add('View_Actions',null,'ActionsWithIcons',['view/actions_icons'])
                ->setModel($this->m);
        }
        if($this->template->hasTag('Action')){
            $this->add('View_Actions',null,'Action',['view/action'])
                ->setModel($this->m);
        }
        if($this->template->hasTag('ActionInner') && $this->m['action_title']){
            $this->add('View_Actions',null,'ActionInner',['view/action_inner'])
                ->setModel($this->m);
        }
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
    function filter_tooltips($val){
        $pd = new Parsedown();
        $dict = [];
        foreach($this->add('Model_Dictionary')->getRows(['name','descr']) as $term){
            $html = $pd->text($term['descr']);
            $txt = strip_tags($html);
            $html = htmlspecialchars($html);
            $dict[$term['name']] = '<span class="tooltip label-dict" title="'.$txt.'" title_html="'.$html.'">'.$term['name'].'</span>';
        }
        $this->js(true)->_selector('.tooltip')->tooltip([
            'content'=>$this->js(null, "return $(this).attr('title_html'); " )->_enclose(),
            'close'=>$this->js(null, '
                    ui.tooltip.hover(

                        function () {
                            $(this).stop(true).fadeTo(400, 1);
                        },

                        function () {
                            $(this).fadeOut("400", function () {
                                $(this).remove();
                            })
                        }
                    )
                ')->_enclose()
        ]);
        $val = str_replace(array_keys($dict), array_values($dict), $val);
        return $val;
    }
    function filter_md($val){
        $Parsedown = new Parsedown();
        $val = $this->filter_tooltips($val);
        return $Parsedown->text($val);
    }

    function filter_page_id($val){
        return $this->app->url($this->add('Model_Page')->tryLoad($val)['hash_url']);
    }
    function filter_firstbold($val){
        // makes first line bold
        $lines = explode("\n", $val);
        $fl = array_shift($lines);
        $lines[0] = '<span class="atk-text-medium">'.$fl.'</span>'.$lines[0];
        return join("\n", $lines);
    }

}
