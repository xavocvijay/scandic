<?php

class PageTest extends BLBaseTest
{

    protected $page;

    use Trait_CreateEntities;

    public function tearDown()
    {
        parent::tearDown();
        $this->page->forceDelete();
    }

    public function testCreateUser(){
        $hash = substr(md5(microtime()),0,5);
        $email = 'test_user_'.$hash.'@test.com';
        $name = 'test_user_'.$hash;

        $this->page = $this->createPage();
        $this->assertEquals('Model_Page',get_class($this->page));
//        $this->assertEquals($this->page['email'],$email);
//        $this->assertEquals($this->page['name'],$name);
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