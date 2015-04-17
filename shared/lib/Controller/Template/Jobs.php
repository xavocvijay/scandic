<?php
class Controller_Template_Jobs extends AbstractController {

    public $show_settings=true;

    function adminEditable(){
        return ['title','content'];
    }

    function forModel($m){
        $m->getElement('content')->type('text')->display(['form'=>'text']);
        $this->setModel($m->reload());
    }

    function adminSettings($f){
        $f->setModel($this->model->refSettings());
    }


    function forFrontend($page){
        $page->add('CompleteLister',null,'TabTitle','TabTitle')->setModel('Jobs');
        $tb = $page->add('CompleteLister',null,'TabBody','TabBody');
        $tb->setModel('Jobs');

        $Parsedown = new Parsedown();

        $tb->addHook('formatRow', function($l)use($Parsedown){
            $l->current_row_html['content_left'] = $Parsedown->text($l->current_row['content_left']);
            $l->current_row_html['content_right'] = $Parsedown->text($l->current_row['content_right']);
        });


        if($page->template->hasTag('Team')){
            $l=$page->add('CompleteLister',null,'Team','Team');
            $l->setModel('Jobs');
            $l->addHook('formatRow', function($l){
                try {
                    $l->current_row['photo'] = $l->app->locateURL('public','images/team/'.$l->current_row['photo'].'.jpg');
                }catch(Exception_PathFinder $e){

                }
            });
        }

        /*
        $set = $this->model->refSettings();
        if($set['display_block'] && $page->template->hasTag('has_block')){
            $v = $page->add('View',null,'has_block','has_block');
            $v->setModel($set);
            $p = $this->add('Model_Page')->load($set['page_id']);
            $v->template->setHTML('url', $u=(string)$this->app->url($p['hash_url']));
        }else{
            $page->template->tryDel('has_block');
        }
        */
    }

    function forAdminIndex($p){
        $p->add('HR');
        $cc = $p->add('Columns');
        $this->app->stickyGET('menu_id');
        $this->cr = $cc->addColumn(8)->add('CRUD');
        $this->cr->setModel('Jobs');
        $c = $cc->addColumn(4);

        $c->add('View_Hint')->set('Do not add more than 2 job positions, otherwise front-end will not render them properly.')->addClass('atk-push');
        $c->add('View_Hint')->set('Use H5 header for job description (in markdown editor)');
    }
}
