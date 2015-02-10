<?php

class UserTest extends BLBaseTest
{

    protected $user;

    use Trait_CreateEntities;

    public function tearDown()
    {
        parent::tearDown();
        $this->user->forceDelete();
    }

    public function testCreateUser(){
        $hash = substr(md5(microtime()),0,5);
        $email = 'test_user_'.$hash.'@test.com';
        $name = 'test_user_'.$hash;
        $this->user = $this->createUser($email,$name);
        $this->assertEquals('Model_User',get_class($this->user));
        $this->assertEquals($this->user['email'],$email);
        $this->assertEquals($this->user['name'],$name);
    }
}

/*


        try {
            $user->forceDelete();
        } catch (Exception $e) {
            echo $e->getMessage()."\n";
            echo $e->getFile()."\n";
            echo $e->getLine()."\n";
            echo $e->getTraceAsString();

        }


 */