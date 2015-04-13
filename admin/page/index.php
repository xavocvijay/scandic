<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 10.02.15
 * Time: 11:25
 */
class page_index extends Page{
    function init(){
        parent::init();

        $this->app->redirect('about');
    }
}
