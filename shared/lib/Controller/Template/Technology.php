<?php
class Controller_Template_Technology extends Controller_Template_Multipage {
    public $title='Technology';

    function forAdminIndex($page){

        $t = $page->tabs->addTab('Technologies');

        $t->add('CRUD')->setModel('Technology');
    }

    function forModel($m){
        $m->getElement('content')->display(['form'=>'text']);
        $this->setModel($m->reload());
    }

    function forFrontend($page){
        parent::forFrontend($page);

        $page->add('ViewBullets',null,'Left','Left')->setModel('Technology')->loadBy('position','left');
        $page->add('ViewBullets',null,'Right','Right')->setModel('Technology')->loadBy('position','right');

        $cl = $page->add('CompleteLister',null,'Middle','Middle');
        $cl->setModel('Technology')->addCondition('position','middle');

        $f = function($l){
            $l->current_row_html['bullets']="<li>".join("</li><li>",explode("\n", $l->current_row['bullets']))."</li>";
            if($l->current_row['class']=='step-3'){
                $l->current_row['bottom_connector']='';
            }
        };

        $cl->addHook('formatRow', $f);
    }


}

class ViewBullets extends View {
    function render(){
        $this->template->setHTML('bullets_html',"<li>".join("</li><li>",explode("\n", $this->model['bullets'])))."</li>";
        parent::render();
    }

}
