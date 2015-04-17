<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 10.02.15
 * Time: 11:25
 */
class page_index extends CmsPage{
    function init(){
        parent::init();

        $this->app->layout->template->trySet('extra_layout_classes', "atk-valign-middle atk-align-center landing");

    }
    function defaultTemplate(){
        $m = $this->add('Model_Page')->tryLoadBy('hash_url',$this->app->pm->page);
        $ret = ['page/index'];
        if(!$m->loaded()){
            $m->loadBy('hash_url', '404');
            $ret = ['page/p404'];
            header("HTTP/1.0 404 Not Found");
        }
        $tpl = $m->ref('template_id');
        $ctl = $this->add('Controller_Template_'.(ucfirst($tpl['sys_name'])));
        $ctl ->forModel($m);


        $this->m = $m;
        $this->tpl = $tpl;
        $this->ctl = $ctl;


        return $ret;

    }
}
