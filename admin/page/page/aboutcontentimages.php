<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 10.02.15
 * Time: 11:25
 */
class page_page_aboutcontentimages extends Page{
    function init(){
        parent::init();
        $content_id = $this->app->stickyGET('about_contents_id');
        $image = $this->add('Model_About_ContentImages');   
        $image->addCondition('content_id',$content_id);
        $this->add('CRUD')->setModel($image);
        
    }
}
