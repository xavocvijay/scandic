<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 11.02.15
 * Time: 18:32
 */
abstract class View_AbstractConstructor extends View{
    public $template_path;
    public $field_list = ['content'];
    public $app_type;
    public function get(){
        if($this->app_type == 'admin'){
            $this->getForAdmin();
        }else{
            $this->getForFrontend();
        }
    }
    public function getForAdmin(){
        $form = $this->add('Form');
        $form->setClass('stacked');
        $form->setModel($this->model,$this->field_list);
        $form->getElement('content')->setCaption($this->model['system_name']);
        $form->addSubmit();

        if($form->isSubmitted()) $form->save();
    }
    public function getForFrontend(){
        if(is_a($this->model,'Model_Page')){
            $blocks = $this->model->getBlocks();
            foreach($blocks as $block){
                $v = $this->add($block['type'],null,$block['system_name']);
                $v->setModel($block);
                $v->get();
            }
        }else{
            $this->setHtml(nl2br($this->model->get('content')));
        }
    }
    function defaultTemplate(){
        if(!$this->app_type == 'admin' && !is_null($this->template_path)){
            return $this->template_path;
        }
        return parent::defaultTemplate();
    }
}