<?php
/**
 * Model implementation
 */
class Controller_Template_About extends AbstractController
{
    public $show_settings=true;
   
    function adminEditable(){
        return ['title','content'];
    }

    function forModel($m){
        $m->getElement('content')->type('text')->display(['form'=>'text']);
        $this->setModel($m->reload());
        $this->model->addMethod('refSettings',$this);
    }

    function adminSettings($f){
        $f->setModel($this->model->refSettings());
    }

    function refSettings($self){

        $m = $self->add('Model');
        $m->addField('display_block')->type('boolean');
        $m->addField('width')->type('dropdown')->setValueList([
            '4'=>'2 columns',
            '6'=>'3 columns',
            '8'=>'4 columns',
            '10'=>'5 columns',
            ]);
        $m->addField('title');
        $m->addField('subtitle');
        $m->addfield('page_id')->display('hierarchy/drilldown')->setModel('Model_Page');
        if(!$self['settings'])$self['settings']='[]';



        $m->setSource('Array',json_decode($self['settings'],true));
        $m->addHook('afterSave', function($m)use($self){
            $self['settings'] = json_encode($m->_table[$m->controller->short_name]);
            $self->save();
        });

        $m->tryLoadAny();
        return $m;
    }


    function forFrontend($page){
        if($page->template->hasTag('Timeline')){
            $l=$page->add('CompleteLister',null,'Timeline','Timeline');
            $l->setModel('About')->setOrder('year desc');
            $l->addHook('formatRow', function($l){
                $l->current_row_html['content']="<li>".join("</li><li>",explode("\n", $l->current_row['content']))."</li>";
            });
            $page->template->set('this_year', date('Y'));
        }

        if($page->template->hasTag('Testimonials')){
            $l=$page->add('CompleteLister',null,'Testimonials','Testimonials');
            $l->setModel('Testimonial');
            $l->addHook('formatRow', function($l){
            });
        }

        if($page->template->hasTag('AboutContent')){
            $m = $this->add('Model_About_Content');
            foreach ($m as  $m1) {
                $page->add('View_AboutContent',['content_m'=>$m1],'AboutContent');
            }

        }


        $set = $this->model->refSettings();
        if($set['display_block'] && $page->template->hasTag('has_block')){
            $v = $page->add('View',null,'has_block','has_block');
            $v->setModel($set);
            $p = $this->add('Model_Page')->load($set['page_id']);
            $v->template->setHTML('url', $u=(string)$this->app->url($p['hash_url']));
        }else{
            $page->template->tryDel('has_block');
        }
    }

    function forAdminIndex($p){

        $t = $p->tabs->addTab('Timeline & Testimonials');

        $cc = $t->add('Columns');

        $c = $cc->addColumn(6);
        $c->add('H2')->set('Timeline');
        $this->cr = $c->add('CRUD');
        $this->cr->setModel('About');

        $c = $cc->addColumn(6);
        $c->add('H2')->set('Testimonials');
        $this->cr = $c->add('CRUD');
        $this->cr->setModel('Testimonial');


        $c_tab = $p->tabs->addTab('About Content');
        $this->cr = $c_tab->add('CRUD');
        $this->cr->setModel('About_Content');
        $this->cr->grid->addColumn('Expander','aboutcontentimages','images');
        // $this->cr->addRef('About_ContentImages',['label'=>'Images']);        
    }

}
