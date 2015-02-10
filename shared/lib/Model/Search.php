<?php
class Model_Search extends Model_BaseTable {

    use Trait_DTS;

    public $table = 'search';
    public $related_entities = [];

    function init(){
        parent::init();

        $this->addField('content');
        $this->addField('block_id');

        $this->addHooks();
    }

    private function addHooks(){
        $this->createdDTS();
    }
}