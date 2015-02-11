<?php

class PageTest extends BLBaseTest
{

    protected $page;

    use Trait_CreateEntities;

    public function tearDown()
    {
        parent::tearDown();
        if($this->page) $this->page->forceDelete();
    }

    public function testCreateUser(){
        $hash = substr(md5(microtime()),0,5);
        $title = 'test_page_'.$hash;

        $this->page = $this->createPage($title);
        $this->assertEquals('Model_Page',get_class($this->page));
        $this->assertEquals($this->page['title'],$title);
    }

    public function testCreateUserFailType(){
        try{
            $this->page = $this->createPage(null,'top','shot');
        }catch (Exception_InvalidField $e){
            $this->assertInstanceOf('Exception_InvalidField',$e);
            return;
        }catch(Exception $e){
            $this->fail('Incorrect Exception was thrown');
        }
        $this->fail('Exception_InvalidField was not thrown');
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