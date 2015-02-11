<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 10.02.15
 * Time: 11:25
 */
class page_page extends Page{
    function init(){
        parent::init();

        $m = $this->add('Model_Page');

        $c = $this->add('CRUD');
        $c->setModel($m,
            ['title','menu_type','type','has_content','has_sub_pages','hash_url','meta_keywords','meta_description'],
            ['title','menu_type','type','has_content','has_sub_pages']
        );
    }
}