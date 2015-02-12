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

        $this->add('View')->addClass('atk-box')->set('banner');

        //Basic content view
        $page_content_view = $this->add('View')->addClass('atk-box atk-cells atk-cells-gutter');

        //Left Menu
        if($page['has_sub_pages'] && count($sub_pages = $page->getSubPages()->getRows())){
            $left_menu = $page_content_view->add('View')->addClass('atk-cell atk-box')->add('Menu_Vertical');
            foreach($sub_pages as $sub_page){
                $this->app->addMenuItem($left_menu,$sub_page['title'],'home-1','',$sub_page['hash_url']);
            }
        }

        $content_view = $page_content_view->add('View')->addClass('atk-cell atk-jackscrew atk-box');
        $view = $content_view->add('Controller_PageConstructor_Factory')->getByType($content_view,$page['type']);
        $view->setModel($page);
        $view->get();

    }
}