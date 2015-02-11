<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 11.02.15
 * Time: 17:56
 */
class View_PageConstructor_OCM extends View_AbstractConstructor{
    function init(){
        parent::init();
    }
    public function getForAdmin(){
        $block = $this->add('Model_Block')
            ->addCondition('type','View_Block_H2Italic')
            ->addCondition('page_id',$this->model->id)
            ->addCondition('system_name','pagemoto')
            ->addCondition('language_id',$this->app->language_id)//TODO take real
            ->tryLoadAny();

        if(!$block->loaded()){
            $block->save();
        }

        $view = $this->add('View_Block_H2Italic',['app_type'=>'admin']);
        $view->setModel($block);
        $view->get();
    }
}