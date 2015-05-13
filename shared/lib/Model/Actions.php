<?php
/**
 * Model implementation
 */
class Model_Actions extends SQL_Model
{
    public $table="actions";

    /**
     * init model
     *
     * @return void
     */
    function init()
    {
        parent::init();

        $this->addField('name')->caption('Label');
        $this->hasOne('Page')->display(['form'=>'hierarchy/drilldown']);
        $this->addField('url')->caption('or External URL');
        $this->add('misc/Field_Callback','url_full')->set(function($m){
            return $m->app->url($m['url']?:$m->ref('page_id')['hash_url']);
        });


        $this->addfield('icon');//->enum(['team','user-network-fix','scandic','team','paper-plane']);

    }
}
