<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 11.02.15
 * Time: 19:46
 */
class page_dynamicpage extends Page{
    function init(){
        parent::init();

        $page = $this->add('Model_Page');

        $page->tryLoadBy('hash_url',$this->app->real_page);
        if(!$page->loaded()) throw $this->exception('There is no such a page','NoPage');

        $this->title = $page['title'];

        $blocks = $page->getBlocks();

        foreach($blocks as $block){
            $view_block = $this->add($block['type']);
            $view_block->setModel($block);
            $view_block->get();

        }
    }
}