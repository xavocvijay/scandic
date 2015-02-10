<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 02.02.15
 * Time: 15:15
 */
trait Trait_CreateEntities {

    /**
     * @return mixed
     */
    protected function createUser($name=null) {
        $hash = substr(md5(microtime()),0,5);
        $email = 'test_user_'.$hash.'@test.com';
        if(!$name) $name = 'test_user_'.$hash;
        $user_data = [
            'name'        => $name,
            'email'       => $email,
            'password'    => '123123'
        ];
        return $this->app->add('Model_User')->create($user_data);
    }


    protected function createPage($title=null) {
        $hash = substr(md5(microtime()),0,5);
        if(!$title) $title = 'test_page_'.$hash;
        $page_data = [
            'title'        => $title,
            'menu_type',
            'type',
            'has_content',
            'has_sub_pages',
        ];
        return $this->app->add('Model_Page')->create($page_data);
    }

}