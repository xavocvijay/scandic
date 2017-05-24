<?php
/**
 * Model implementation
 */
class Model_Technology extends SQL_Model
{
    public $table="technology";

    /**
     * init model
     *
     * @return void
     */
    function init()
    {
        parent::init();

        $this->addField('name');

        $this->addField('position')->enum(['left','right','middle']);


        $this->addField('content')->type('text');
        $this->addField('bullets')->type('text');

        $this->addField('class');
        $this->addField('ord');
        $this->add('filestore/Field_Image','image_id');
        $this->addField('image_position')->enum(['left','center','right']);

    }
}
