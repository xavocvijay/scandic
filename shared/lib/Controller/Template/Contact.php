<?php
class Controller_Template_Contact extends AbstractController {

    function adminEditable(){
        return ['title','content','address','requisites'];
    }

    function forModel($m){
        $m->getElement('content')->type('text')->display(['form'=>'text']);
        $m->addField('address')->type('text');
        $m->addField('requisites')->type('text');
        $m->reload();
    }
}
