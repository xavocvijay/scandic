<?php
class Model_User extends Model_BaseTable {

    use Trait_DTS, Trait_Validation;

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
        if($this->loaded()) throw $this->exception(get_class($this).' MUST NOT be loaded','LoadedModel');
        if(!isset($data['name']) || !$data['name']) $data['name'] = 'User_'.substr(md5(microtime()),0,5);

        //validation
        $fields_errors = [];
        if(!isset($data['email']) || !$data['email'])
            $fields_errors['email'] = $this->exception('User email is empty','NoEmail');
        if(!isset($data['password']) || !$data['password'])
            $fields_errors['password'] = $this->exception('User password is empty','NoPassword');
        try{
            $this->validateEmail($data['email']);
        }catch (Exception_NotEmail $e){
            $fields_errors['email'] = $e;
        }
        try{
            $this->validatePassword($data['password']);
        }catch (Exception_IncorrectPassword $e){
            $fields_errors['password'] = $e;
        }

        if($fields_errors) throw $this->exception($fields_errors,'InvalidField');

        //Try save
        try{
            $this->set($data)->save();
        }catch (Exception $e){
            throw $this->exception('Can not create new user '.$e->getMessage(),'CanNotSave');
        }
        return $this;
    }
}