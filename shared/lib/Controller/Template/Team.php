<?php
class Controller_Template_Team extends AbstractController {

    public $show_settings=true;

    function adminEditable(){
        return ['title','content','address','requisites'];
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
        if($page->template->hasTag('Team')){
            $l=$page->add('CompleteLister',null,'Team','Team');
            $l->setModel('Team');
            $l->addHook('formatRow', function($l){
                try {
                    $l->current_row['photo'] = $l->app->locateURL('public','images/team/'.$l->current_row['photo'].'.jpg');
                }catch(Exception_PathFinder $e){

                }
            });
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
        $p->add('HR');
        $cc = $p->add('Columns');
        $this->app->stickyGET('menu_id');
        $this->cr = $cc->addColumn(8)->add('CRUD');
        $this->cr->setModel('Team','editable',['name_en','position_en','photo','ord']);
        $c = $cc->addColumn(4);

        $c->add('View_Hint')->set('To add a new team member you will manually need to add a picture to the site inside '.
            'folder frontend/public/images/team/');

        $c->add('View_Hint')->set('Drag and drop lines above to reorder pages.')->addClass('atk-push');

        $p->js()->_load('atk4HomePage');

        $p->js(true)->atk4HomePage()->makeSortable($this->cr->getJSID(),"tbody>tr",'data-id',$this->app->url());

        $this->updateOrder($this->cr, $this->cr->model);
    }
    protected function updateOrder(\AbstractView $view, Model $m) {

        if ($_GET['action'] == 'refresh_order') {
            $ids = $_GET['ids'];
            $ids_arr = [];
            foreach (explode(',',$ids) as $k=>$v) {
                $ids_arr[$v] = $k;
            }
            $m->addCondition('id','in',$ids);

            foreach ($m as $row) {
                $row->set('ord',$ids_arr[$row->id])->saveAndUnload();
            }
            $view->js()->univ()->successMessage('Order updated')->execute();
        }
    }
}
