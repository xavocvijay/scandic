<?php
class Model_Page extends Model_BaseTable {

    use Trait_DTS, Trait_RelatedEntities;

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


    public function getBlocks($as_array=false,$limit=false,$offset=0,$order=false,$desc=true) {
        $bc = $this->add('Model_Block')->deleted($this['is_deleted'])->addCondition('page_id',$this->id);
        return $this->prepareRelated($bc,$as_array,$limit,$offset,$order,$desc);
    }
}