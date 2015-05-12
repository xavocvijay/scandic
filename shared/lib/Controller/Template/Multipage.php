<?php
class Controller_Template_Multipage extends AbstractController {
    public $title='Services';
    public $show_settings=true;

    function adminEditable(){
        if($this->model['parent_id']){
            return ['title','intro','content','keywords'];
        } else {
            return ['title','content'];
        }
    }

    function addSettings($m){
        $m->add('Controller_SettingsSubmodel')
            ->withFields(function($m){

                $m->addField('label_text')->type('text');
                //$m->hasOne('Page','label_page_id');
                $m->addField('label_page_id')->display('hierarchy/drilldown')->setModel('Model_Page');
                $m->addfield('label_link');

            });
    }
    function forModel($m){
        $m->addField('intro')->type('text');//->onField(function($f){ echo 'hi'; });
        $m->getElement('content');//->display(['form'=>'text']);

        $this->addSettings($m);

        $this->setModel($m->reload());
    }

    function adminSettings($f){
        if($this->model['parent_id']){
            $f->setModel($this->model, ['icon']);
        }else{
            $f->setModel($this->model->refSettings(), ['label_text', 'label_page_id', 'label_link']);

        }
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
            $is_top = !$m['parent_id'];
            if($m['parent_id'])$m=$m->ref('parent_id');

            $cl = $page->add($is_top?'View_SubPageLister':'CompleteLister',null,'SubMenu','SubMenu')
                ->setModel($m->ref('Page'))
                ->addCondition('is_public', true)
                ->addHook('afterLoad', function($m)use($id){
                    $m['is_active'] = $id==$m->id?'active':'';
                    $m['page']=$m->app->url($m['hash_url']);
                });

            if(!$m->hasMethod('refSettings'))$this->addSettings($m);
            $settings=$m->refSettings();

            if($settings['label_page_id'] || $settings['label_link']){

                $items = $settings->get();
                $items['label_link']=$items['label_link']?:$this->app->url($this->add('Model_Page')->load($settings['label_page_id'])['hash_url']);
                $items['label_text']=nl2br($items['label_text']);


                unset($items['id']);
                $page->template->setHTML($items);
            }
        }
    }

    function addSubPageNavigation(){
        $m = $this->model;

        if($m['parent_id'])$m=$m->ref('parent_id');

        $m = $this->add('Model_Page')->addCondition('parent_id', $m->id);

        $m->addHook('afterLoad',function($m){
                $m['title']=[strip_tags($m['title']),
                    'icon'=>$m['is_public']?'eye':'eye-off'
                ];
                $u = $m->app->url('page');
                $m['page']=$u->set('url', $m['hash_url']);
            });



        $this->app->layout->add('HR',null,'Navigation');
        $bs = $this->app->layout->add('Button',null,'Navigation')
            ->set([false,'icon'=>'shuffle'])
            ->addClass('atk-move-right atk-swatch-ink');
        $b = $this->app->layout->add('Button',null,'Navigation')
            ->set([false,'icon'=>'plus'])
            ->addClass('atk-move-right atk-swatch-ink');
        $t = $this->app->layout->add('H2',null,'Navigation');
        $t->add('Text')->set($this->title);
        $b->js('click')->univ()->dialogURL('Add Sub Page', $this->app->url('./addsub'));


        $menu = $this->app->layout->add('Menu_Vertical',null,'Navigation2');
        $bs->js('click')->univ()->frameURL('Change Order', $this->app->url('./order'));//, ['close'=>$menu->js()->reload()->_enclose()]);
        $menu->setModel($m);
    }

}
