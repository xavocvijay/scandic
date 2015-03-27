<?php
class Menu_Advanced_Item extends View {
    function set($data){
        if(is_array($data)){
            if($data['icon2']){

                $this->add('Icon',null,'Badge')->set($data['icon2']);
            }
            unset($data['icon2']);
        }

var_dump($data);
        return parent::setHtml($data);
    }
}
