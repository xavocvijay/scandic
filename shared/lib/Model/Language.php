<?php
class Model_Page extends Model_BaseTable {

    use Trait_DTS;

    public $table = 'language';
    public $related_entities = [];
    public static $available_languages = [//Just a list of all langs to choose from
        'en',
        'lv',
        'ru',
        'fr'
    ];

    function init(){
        parent::init();

        $this->addField('lang_code')->setValueList(self::$available_languages);

        $this->addHooks();
    }

    private function addHooks(){
        $this->createdDTS();
    }
}