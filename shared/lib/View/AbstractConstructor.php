<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 11.02.15
 * Time: 18:32
 */
abstract class View_AbstractConstructor extends View{
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
//        exit('thfg');
//        $this->set($this->model->get());
    }
    function defaultTemplate(){
        if($this->app_type = 'admin'){
            return parent::defaultTemplate();
        }else{
            return parent::defaultTemplate();
        }
    }
}