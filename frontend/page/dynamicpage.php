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


        //Sub Menu
        if(count($sub_pages = $page->getSubPages()->getRows())){
            $left_menu = $page_content_view->add('View')->addClass('atk-cell atk-box')->add('Menu_Vertical');
            foreach($sub_pages as $sub_page){
                $this->app->addMenuItem($left_menu,$sub_page['title'],'home-1','',$sub_page['hash_url']);
            }
        }

        $content_view = $page_content_view->add('View')->addClass('atk-cell atk-jackscrew atk-box');

        $view = $content_view->add('View_PageConstructor_ATK4HomePage',['template_path'=>$page->getTemplatePath()]);
        $view->setModel($page);
        $view->get();

        $this->getPageMenu($view,$page);

    }

    protected function getPageMenu(AbstractView $view,Model_Page $page) {
        if ($view->template->hasTag('SubMenu') && $siblings = $page->getSiblings()) {

            $menu = $view->add('Menu',null,'SubMenu');
            foreach($siblings as $page){
                $url = $page['hash_url']?:$page['url_first_child'];
                $this->addMenuItem($menu,$page['title'],'home-1','atk-swatch-beigeDarken',$url);
            }

        }
    }


    public function addMenuItem($menu,$title,$icon,$class,$url){
        //if ($this->isCurrent(strtolower($url))) $active_class='ui-state-active'; else $active_class='';
        if ($url) {
            $url = $this->app->url($url);
        } else {
            $url = strtolower($title);
        }
        $menu->addItem(array($title, 'icon'=>$icon),$url)->addClass($class.' '/*.$active_class*/);
    }
}