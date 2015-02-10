<?php
class Model_Search extends Model_BaseTable {

    public $table = 'search';
    public $related_entities = [];

    function init(){
        parent::init();

        $this->addField('content');
        $this->addField('block_id');
    }
}