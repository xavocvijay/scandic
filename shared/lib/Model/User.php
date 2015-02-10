<?php
class Model_User extends Model_BaseTable {

    use Trait_DTS;

    public $table = 'user';
    public $related_entities = [];

    function init(){
        parent::init();

        if (@$this->app->auth) $this->app->auth->addEncryptionHook($this);

        $this->addField('email');
        $this->addField('password');
        $this->addField('name');
        $this->addField('created_dts')->type('date');

        $this->addHooks();
    }

    private function addHooks(){
        $this->createdDTS();
    }
}