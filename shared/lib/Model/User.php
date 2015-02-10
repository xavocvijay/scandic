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

    public function create($data){
        if(!is_array($data)) throw $this->exception('Data is not an array','IncorrectData');

        if(!isset($data['email']) || !$data['email']) throw $this->exception('User email is empty','NoEmail');
        if(!isset($data['password']) || !$data['password']) throw $this->exception('User password is empty','NoPassword');
        if(!isset($data['name']) || !$data['name']) $data['name'] = 'New User Name ';
        if($this->loaded()) throw $this->exception('Model User MUST NOT be loaded','LoadedModel');

        try{
            $this->set($data)->save();
        }catch (Exception $e){
            throw $this->exception('Can not create new user','CanNotSave');
        }
        return $this;
    }
}