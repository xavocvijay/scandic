<?php

class Model_ClientLogo extends SQL_Model{
    public $table="client_logos";

    /**
     * init model
     *
     * @return void
     */
    function init(){
        parent::init();

        $this->addField('name');
        $this->addField('position');
        $this->add('filestore/Field_File','client_logo_id');

    }
}