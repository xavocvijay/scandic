<?php
class Controller_Template_Services extends AbstractController {

    function adminEditable(){
        return ['title','intro','content','keywords'];
    }

    function forModel($m){
        $m->addField('intro')->type('text');//->onField(function($f){ echo 'hi'; });
        $this->setModel($m->reload());
    }

    function adminSettings($f){
        $f->setModel($this->model, ['icon']);
    }

    function forFrontend($page){
        if($page->template->hasTag('Keywords')){
            $page->add('CompleteLister',null,'Keywords','Keywords')
            ->setSource(explode("\n",trim($this->model['keywords'])));
        }

        if($page->template->hasTag('SubMenu')){
            // add menu
            $m = $this->model;
            $id = $m->id;
            if($m['parent_id'])$m=$m->ref('parent_id');

            $cl = $page->add('CompleteLister',null,'SubMenu','SubMenu')
                ->setModel($m->ref('Page'))
                ->addHook('afterLoad', function($m)use($id){
                    $m['is_active'] = $id==$m->id?'active':'';
                    $m['page']=$m->app->url($m['hash_url']);
                });
        }
    }

    function addSubPageNavigation(){
        $m = $this->model;

        if($m['parent_id'])$m=$m->ref('parent_id');

        $m = $this->add('Model_Page')->addCondition('parent_id', $m->id);

        $m->addHook('afterLoad',function($m){
                $m['title']=[strip_tags($m['title']),'icon'=>$m['icon']?:'help'];
                $u = $m->app->url('page');
                $m['page']=$u->set('url', $m['hash_url']);
            });



        $this->app->layout->add('HR',null,'Navigation');
        $t = $this->app->layout->add('H2',null,'Navigation');
        $t->add('Text')->set('Services');
        $b = $t->add('Button')->set([false,'icon'=>'plus'])->addClass('atk-move-right atk-swatch-ink');
        $b->js('click')->univ()->dialogURL('Add Service Page', $this->app->url('./addsub'));

        $menu = $this->app->layout->add('Menu_Vertical',null,'Navigation');
        $menu->setModel($m);
    }

}