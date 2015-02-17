<?php
class Model_PageTranslation extends SQL_Model {
    public $table = 'page_translation';


    function init(){
        parent::init();

        $this->addField('page_id');
        $this->addField('language');
        $this->addField('meta_title');
        $this->addField('meta_keywords');
        $this->addField('meta_description');
    }
}