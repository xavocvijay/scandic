<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 11.02.15
 * Time: 17:56
 */
class View_PageConstructor_ATK4HomePage extends View_AbstractConstructor{
    public $template_path;
    function init(){
        parent::init();
    }

    protected function getForAdmin(){
       $this->addBlocks('admin');
    }

    protected function addBlocks($app_type = 'frontend'){
//        var_dump($this->model['type']);exit;
        if($this->model['type']){
            $this->blocks = $this->app->getConfig('atk4-home-page/page_types/'.$this->model['type'].'/blocks',[]);

            foreach($this->blocks as $sys_name=>$type){
                $this->addBlock($this->model->id, $sys_name, $type, $app_type);
            }
        }
    }
    private function addBlock($page_id, $sys_name, $type, $app_type){
        $block = $this->add('Model_Block')
            ->addCondition('type',$type)
            ->addCondition('page_id',$page_id)
            ->addCondition('system_name',$sys_name)
            ->addCondition('language_id',$this->app->language_id)//TODO take real
            ->tryLoadAny();

        if(!$block->loaded()){
            $block->save();
        }

        $view = $this->add('View_Block_ATK4HomeBlock',['app_type'=>$app_type]);
        $view->setModel($block);
        $view->get();
    }
    protected function getForFrontend(){
        $blocks = $this->model->getBlocks();

        $error_messages = [];

        foreach($blocks as $block){

            if ($this->template->hasTag($block['system_name'])) {
                $v = $this->add('View_Block_ATK4HomeBlock',[
                    'template_path'=>$this->app->getConfig('atk4-home-page/block_types/'.$block['type'].'/template')
                ],$block['system_name']);
                $v->setModel($block);
                $v->get();
            }else{
                $error_messages[] = 'There is no tag '.$block['system_name'].' in template.';
            }
        }
        if(count($error_messages)){
            $this->js(true)->univ()->alert(implode("\n",$error_messages));
        }
    }
}