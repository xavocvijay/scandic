<?php
class Controller_Template_Index extends AbstractController {

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

                $m->addField('action_3');
                $m->addfield('action_3_link')->display('hierarchy/drilldown')->setModel('Model_Page');

                $m->addField('hiring_title');
                $m->addField('hiring_subtitle');
                $m->addField('hiring_link')->display('hierarchy/drilldown')->setModel('Model_Page');
            });

        $this->setModel($m);
    }

    function forFrontend($page){
        $set = $this->model->refSettings();
        $page->applyTags($set->get());
        if(!$set['hiring_title'])$page->template->tryDel('has_hiring');
    }
}
