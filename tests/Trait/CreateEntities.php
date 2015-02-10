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
    protected function createUser($email=null,$name=null) {
        $hash = substr(md5(microtime()),0,5);
        if(!$email) $email = 'test_user_'.$hash.'@test.com';
        if(!$name) $name = 'test_user_'.$hash;
        $data = [
            'name'        => $name,
            'email'       => $email,
            'password'    => '123123'
        ];
        return $this->app->add('Model_User')->create($data);
    }


    protected function createPage(
        $title     = null,
        $menu_type = 'top',
        $type = 'home',
        $has_content = 1,
        $has_sub_pages = 0
    ) {
        $hash = substr(md5(microtime()),0,5);
        if(!$title) $title = 'test_page_'.$hash;
        $data = [
            'title'         => $title,
            'menu_type'     => $menu_type,
            'type'          => $type,
            'has_content'   => $has_content,
            'has_sub_pages' => $has_sub_pages,
        ];
        return $this->app->add('Model_Page')->create($data);
    }

}