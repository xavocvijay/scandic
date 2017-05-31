<?php
class Controller_Template_Technology extends Controller_Template_Multipage {
    public $title='Technology';
    public $show_settings=false;

    function forAdminIndex($page){

        $t = $page->tabs->addTab('Technologies');

        $cr = $t->add('CRUD');
        $cr->setModel('Technology');
        $cr->grid->add('Controller_OrderedGrid');
    }

    function forModel($m){
        $m->getElement('content')->display(['form'=>'text']);
        $this->setModel($m->reload());
    }

    function forFrontend($page){
        parent::forFrontend($page);

        $left_l = $page->add('CompleteLister',null,'Left','Left');
        $left_l->setModel('Technology')->loadBy('position','left');
        
        $left_l->addHook('formatRow',function($l){
            $l->current_row_html['block_position'] = $l->model['position'];
            $l->current_row_html['bullets']="<li>".join("</li><li>",explode("\n", $l->current_row['bullets']))."</li>";
            if($l->current_row['class']=='step-3'){
                $l->current_row['bottom_connector']='';
            }
        });

        $right_l = $page->add('CompleteLister',null,'Right','Right');
        $right_l->setModel('Technology')->loadBy('position','right');
        $right_l->addHook('formatRow',function($l){
            $l->current_row_html['block_position'] = $l->model['position'];
            $l->current_row_html['bullets']="<li>".join("</li><li>",explode("\n", $l->current_row['bullets']))."</li>";
            if($l->current_row['class']=='step-3'){
                $l->current_row['bottom_connector']='';
            }            
        });

        $cl = $page->add('CompleteLister',null,'Center','Center');
        $cl->setModel('Technology')->addCondition('position','center');

        $f = function($l){
            $l->current_row_html['bullets']="<li>".join("</li><li>",explode("\n", $l->current_row['bullets']))."</li>";
            if($l->current_row['class']=='step-3'){
                $l->current_row['bottom_connector']='';
            }
            $l->current_row_html['image_position'] = $l->model['image_position'];
            $l->current_row_html['block_position'] = $l->model['position'];
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
