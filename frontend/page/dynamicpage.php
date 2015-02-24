<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 11.02.15
 * Time: 19:46
 */
class page_dynamicpage extends Page{
    public $page_translation;
    function init(){
        parent::init();

        $page = $this->add('Model_Page');

        $page->tryLoadBy('hash_url',$this->app->real_page);
        if(!$page->loaded()) throw $this->exception('There is no such a page','atk4\atk4homepage\NoPage');

        $this->page_translation = $page->getTranslation(true);
        $this->title = $this->page_translation['meta_title'];

        $this->add('View')->addClass('atk-box')->set('banner');

        //Basic content view
        $page_content_view = $this->add('View')->addClass('atk-box atk-cells atk-cells-gutter');

        $content_view = $page_content_view->add('View')->addClass('atk-cell atk-jackscrew atk-box');

        $view = $content_view->add('View_PageConstructor_ATK4HomePage',['template_path'=>$page->getTemplatePath()]);
        $view->setModel($page);
        $view->get();

        $this->getPageMenu($view,$page);

    }

    protected function getPageMenu(AbstractView $view,Model_Page $page) {
        if ($view->template->hasTag('SubMenu') && $siblings = $page->getSiblings()) {

            $menu = $view->add('Menu_Vertical',null,'SubMenu');
            foreach($siblings as $page){
                $page->page_translation = $page->getTranslation(true);
                $url = $page['hash_url']?:$page['url_first_child'];
                $this->app->addMenuItem($menu,$page->page_translation['meta_title'],'home-1','atk-swatch-beigeDarken',$url);
            }

        }
    }
}