<?php
class View_TemplateChooser extends CompleteLister {

    function init(){
        parent::init();
        $this->setModel('Template');

    }

    function onSelect($c){

        if($_GET['template']){
            call_user_func($c, $_GET['template']);
        }
    }

    function formatRow(){
        parent::formatRow();
        $this->current_row['thumb'] = $this->app->locateURL('public','image/wireframe/'.$this->model['sys_name'].'.png');
        $this->current_row['url'] = $this->app->url(null,['template'=>$this->current_id]);
    }

    function defaultTemplate(){
        return ['view/template-selector'];
    }

}
