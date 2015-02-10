<?php
class Model_Page extends Model_BaseTable {

    use Trait_DTS;

    public $table = 'page';
    public $related_entities = [
        ['Block', ['type'=>'hard', 'field'=>'page_id']],
    ];

    function init(){
        parent::init();

        $this->addField('title');
        $this->addField('menu_type');
        $this->addField('type');
        $this->addField('has_content');
        $this->addField('has_sub_pages');
        $this->addField('order');
        $this->addField('meta_keywords');
        $this->addField('meta_description');
        $this->addField('language_id');

        $this->addHooks();
    }

    private function addHooks(){
        $this->createdDTS();
    }
}