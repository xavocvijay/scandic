<?php
class Model_Language extends Model_BaseTable {

    public $table = 'language';
    public $related_entities = [];


    function init(){
        parent::init();

        $this->addField('lang_code')->setValueList($this->app->getConfig('available_languages',['en']));

    }

}