<?php
class Model_Page extends Model_BaseTable {

    use Trait_DTS;

    public $table = 'block';
    public $related_entities = [];

    function init(){
        parent::init();

        $this->addField('system_name');
        $this->addField('type');
        $this->addField('content');
        $this->addField('page_id');
        $this->addField('order');

        $this->addHooks();
    }

    private function addHooks(){
        $this->createdDTS();

        $this->addHook('beforeSave', function($m){
            //TODO Save content to the search table
        });
    }

    public function getPage() {
        return $this->add('Model_Page')->deleted($this['is_deleted']);
    }
}