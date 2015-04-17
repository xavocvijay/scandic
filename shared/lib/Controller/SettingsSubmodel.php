<?php
/**
 * Add this into model to, then use refSettings();
 */
class Controller_SettingsSubmodel extends AbstractController {

    private $_with_fields=null;

    function init(){
        parent::init();
        if(!$this->owner instanceof Model)throw $this->exception('add into model only');
        $this->owner->show_settings = true;
        $this->owner->addMethod('refSettings', $this);
    }

    function withFields($c){
        $this->_with_fields = $c;

    }

    function refSettings($self){

        $m = $self->add('Model');

        call_user_func($this->_with_fields, $m);

        if(!$self['settings'])$self['settings']='[]';

        $m->setSource('Array',json_decode($self['settings'],true));
        $m->addHook('afterSave', function($m)use($self){
            $self['settings'] = json_encode($m->_table[$m->controller->short_name]);
            $self->save();
        });

        $m->tryLoadAny();
        return $m;
    }



}
