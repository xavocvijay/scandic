<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 10.02.15
 * Time: 11:25
 */

class Model_Menu_Admin extends Model_Menu {
    function init(){
        parent::init();

        $this
            ->addHook('afterLoad',function($m){
                $m['name']=strip_tags($m['name']);
                $u = $m->app->url('page');
                $m['page']=$u->set('url', $m['page']);
            });
    }
}

class page_page extends Page{
    function init(){
        parent::init();
        $this->title=[['name'=>'Page Editor', 'page'=>$this->app->url()]];
        // add side navigation
        $m = $this->add('Model_Menu_Admin')->addCondition('parent_id', null);
        $menu = $this->app->layout->add('Menu_Vertical',null,'Navigation');
        $menu->addItem('Index', $this->app->url('page', ['url'=>'index']));
        $menu->setModel($m);
        $menu->addItem('_404 Page', $this->app->url('page', ['url'=>'404']));



        if(!$_GET['url']){
            $this->add('View_Warning')->set('Select Menu item on the left or enter URL in the form below:');

            $f=$this->add('Form',null,null,['form/stacked']);
            $f->addField('line','url','Name of the page you wish to edit')->set('about');
            $f->addSubmit('Edit')->addClass('atk-swatch-green');
            $f->onSubmit(function($f){ return $f->js()->univ()->location($f->app->url(null,['url'=>$f['url']])); });
            throw $this->exception(null,'StopRender');
        }

        $this->model = $m = $this->add('Model_Page')->tryLoadBy('hash_url',$this->app->stickyGET('url'));
        if(!$m->loaded()){
            $this->addCrumbReverse('Create New Page', $this->app->url());

            $tc = $this->add('View_TemplateChooser');
            $tc->onSelect(function($id)use($m){
                // create new page now
                $m['hash_url']=$_GET['url'];
                $m['template_id']=$id;
                $m->save();
                $m->app->redirect($this->app->url());
            });
            throw $this->exception(null,'StopRender');
        }

        $this->addCrumbReverse($m['hash_url'], $this->app->url());

        $this->tpl = $m->ref('template_id');
        $this->ctl = $this->add('Controller_Template_'.(ucfirst($this->tpl['sys_name'])));

        $this->ctl->forModel($m);
        if(!$this->ctl->model)$this->ctl->setModel($m);

        if($this->ctl->hasMethod('addSubPageNavigation'))$this->ctl->addSubPageNavigation();


    }
    function page_index(){
        $m = $this->model;

        $bs = $this->add('ButtonSet')->addClass('atk-push');
        $bs->addButton('SEO');
        if($m['parent_id'] || @$this->ctl->show_settings || @$m->show_settings ){
            $bs->addButton('Settings')->js('click')->univ()->dialogURL('Settings', $this->app->url('./settings'));
        }
        if($m['is_public']){
            $bs->addButton(['Public','icon'=>'check'])->set('Public')
                ->onClick(function($b)use($m){
                    $m['is_public']=false;
                    $m->save();
                    return $b->js()->reload();
                });
        }else{
            $bs->addButton(['Public','icon'=>'check-empty'])->set('Draft')
                ->onClick(function($b)use($m){
                    $m['is_public']=true;
                    $m->save();
                    return $b->js()->reload();
                });
        }

        $bs->addButton('Preview')->addClass('atk-swatch-green');

        $bs = $this->add('ButtonSet')->addClass('atk-push atk-move-right');
        $bs->addButton('Delete')->addClass('atk-swatch-red')->onClick(function($b)use($m){
            $m->delete();
            return $b->js()->univ()->location($this->app->url(null,['url'=>null]));
        },"Delete page ".$m['title']."?");

        $form = $this->add('Form');
        $form->setClass('stacked');
        $form->setModel($m, $this->ctl->adminEditable());
        //$form->getElement('content')->setCaption($this->model['system_name']);
        $form->addSubmit('Save')->addClass('atk-swatch-green');
        $form->onSubmit(function($f){ $f->update(); return 'Saved';});

        if($this->ctl->hasMethod('forAdminIndex'))$this->ctl->forAdminIndex($this);

    }
    function page_addsub(){
        $f = $this->add('Form');
        $f->setModel($this->model->newSubPage(),['title','icon']);
        $f->onSubmit(function($f){
            $f->update();
            return $f->js()->univ()->location($this->app->url('..', ['url'=>$f->model['hash_url']]));
        });
    }
    function page_settings(){
        $f = $this->add('Form');
        if($this->ctl->hasMethod('adminSettings')){
            $this->ctl->adminSettings($f);
        }else{
            $f->setModel($this->model->refSettings());

        }
        $f->onSubmit(function($f){
            $f->save();
            return $f->js()->univ()->location($this->app->url('..'));
        });
    }

}

