<?php
class View_Actions extends View {
    public $sub=[1,2];
    function init(){
        parent::init();
    }
    function setModel($m){
        $m = parent::setModel($m);

        foreach($this->sub as $x){
            if($m['action'.$x.'_id']){
                $this->add('View',null,'Action'.$x,'Action'.$x)->setModel($m->ref('action'.$x.'_id'));
            }
        }
    }
}
