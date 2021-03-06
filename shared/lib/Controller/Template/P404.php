<?php
class Controller_Template_P404 extends AbstractController {

    function adminEditable(){
        return ['title'];
    }

    function forModel($m){
        #$m->getElement('content')->type('text')->display(['form'=>'text']);
        $m->reload();

        $m->add('Controller_SettingsSubmodel')
            ->withFields(function($m){

                $m->addField('action_1');
                $m->addfield('action_1_link')->display('hierarchy/drilldown')->setModel('Model_Page');

                $m->addField('action_2');
                $m->addfield('action_2_link')->display('hierarchy/drilldown')->setModel('Model_Page');

                $m->addField('hiring_title');
                $m->addField('hiring_subtitle');
            });

        $this->setModel($m);
    }

    function forFrontend($page){
        $set = $this->model->refSettings();
        $page->applyTags($set->get());
    }
}
