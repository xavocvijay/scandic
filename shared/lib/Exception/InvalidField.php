<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 16.01.15
 * Time: 13:48
 */
class Exception_InvalidField extends BaseException {
    protected $array = [];
    public function setArray($array){
        $this->array = $array;
        return $this;
    }
    public function getArray(){
        return $this->array;
    }
}