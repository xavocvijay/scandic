<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 11.02.15
 * Time: 18:05
 */
class View_Block_ATK4HomeBlock extends View_AbstractConstructor{
    public $template_path = 'view/block';
    public function getForAdmin(){
        $form = $this->add('Form');
        $form->setClass('stacked');
        $form->setModel($this->model,$this->field_list);
        $form->getElement('content')->setCaption($this->model['system_name']);
        $form->addSubmit();

        if($form->isSubmitted()) $form->save();
    }
    public function getForFrontend(){

        $this->setHtml(nl2br($this->model->get('content')));
    }

}