<?php
class Model_Menu extends SQL_Model
{
    public $table="menu";

    public $title_field = 'name_en';

    /**
     * init model
     *
     * @return void
     */
    function init()
    {
        parent::init();

        $this->setController('hierarchy/Table',array('child_ref' => 'Menu'))
            ->useField('parent_id');


        $this->addField('page');

        $this->addField('name_en')->type('text');
        $this->addField('name_lv')->type('text');
        $this->addField('name_ru')->type('text');

        $this->addHook('afterLoad',function($m){ $m['name'] = nl2br($m[$m->title_field]); });

        $this->getElement('menu_cnt')->caption('Sub Pages');


    }

    /**
     * Creates joins between models, so that URL is instantly available as a field
     */
    function joinHashURL()
    {

        // NOT TESTED

        $this->getElement('page_id')->destroy(); // no need for this filed
        $this->join('page')->addField('url_hash');
    }
}
