<?php
/**
 * Model implementation
 */
class Model_Testimonial extends SQL_Model
{
    public $table="testimonial";

    /**
     * init model
     *
     * @return void
     */
    function init()
    {
        parent::init();

        $this->addField('name');
        $this->addField('position');
        $this->addField('logo');
        $this->addField('content')->type('text');

    }
}
