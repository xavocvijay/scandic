<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 11.02.15
 * Time: 17:56
 */
class View_PageConstructor_TCM extends View_AbstractConstructor{
    public $template_path = ['page/tcm'];
    function init(){
        parent::init();
    }
    public function getForAdmin(){
        $this->getFirstBlock();
        $this->getSecondBlock();
        $this->getThirdBlock();
    }
    private function getThirdBlock(){
        $block = $this->add('Model_Block')
            ->addCondition('type','View_Block_Quote')
            ->addCondition('page_id',$this->model->id)
            ->addCondition('system_name','quote')
            ->addCondition('language_id',$this->app->language_id)//TODO take real
            ->tryLoadAny();

        if(!$block->loaded()){
            $block->save();
        }

        $view = $this->add($block['type'],['app_type'=>'admin']);
        $view->setModel($block);
        $view->get();
    }
    private function getSecondBlock(){
        $block = $this->add('Model_Block')
            ->addCondition('type','View_Block_TwoColumns')
            ->addCondition('page_id',$this->model->id)
            ->addCondition('system_name','two_columns_text')
            ->addCondition('language_id',$this->app->language_id)//TODO take real
            ->tryLoadAny();

        if(!$block->loaded()){
            $block->save();
        }

        $view = $this->add($block['type'],['app_type'=>'admin']);
        $view->setModel($block);
        $view->get();
    }
    private function getFirstBlock(){
        $block = $this->add('Model_Block')
            ->addCondition('type','View_Block_H2Italic')
            ->addCondition('page_id',$this->model->id)
            ->addCondition('system_name','italic_top_paragraph')
            ->addCondition('language_id',$this->app->language_id)//TODO take real
            ->tryLoadAny();

        if(!$block->loaded()){
            $block->save();
        }

        $view = $this->add($block['type'],['app_type'=>'admin']);
        $view->setModel($block);
        $view->get();
    }
}