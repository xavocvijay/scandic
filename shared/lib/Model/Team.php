<?php
class Model_Team extends SQL_Model
{
    public $table="team";

    function init()
    {
        parent::init();

        $this->addField('name_en')->type('text')->onField(function($f){ $f->setAttr('rows',2);});
        $this->addField('name_lv')->type('text')->onField(function($f){ $f->setAttr('rows',2);});
        $this->addField('name_ru')->type('text')->onField(function($f){ $f->setAttr('rows',2);});
        $this->addField('position_en');
        $this->addField('position_lv');
        $this->addField('position_ru');
        $this->addField('photo');

        $this->addField('ord');//->system(true); // order
        $this->setOrder('ord,id');
    }
}
