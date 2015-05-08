<?php
class Controller_Template_Industry extends Controller_Template_Multipage {
    public $title='Industry Solutions';

    function forAdminIndex($page){

        $t = $page->tabs->addTab('Boxes');

        $t->add('CRUD')->setModel($this->model->ref('Box'),['name','position','content']);
    }

    function forFrontend($page){
        parent::forFrontend($page);
        $Parsedown = new Parsedown();

        $f = function($l)use($Parsedown){
            //$l->current_row_html['content']="<li>".join("</li><li>",explode("\n", $l->current_row['content']))."</li>";
            $l->current_row_html['content']=$Parsedown->text($l->current_row['content']);
        };

        // now add boxes
        if($page->template->hasTag('Box_left')){
            $m = $this->model->ref('Box','model')->addCondition('position','left');
            $cl = $page->add('CompleteLister',null,'Box_left','Box_left');
            $cl->setModel($m);
            $cl->addHook('formatRow', $f);
        }


        if($page->template->hasTag('Box_right')){
            $m = $this->model->ref('Box','model')->addCondition('position','right');
            $cl = $page->add('CompleteLister',null,'Box_right','Box_right');
            $cl->setModel($m);
            $cl->addHook('formatRow', $f);
        }

    }


}
