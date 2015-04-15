<?php
class Model_Page extends SQL_Model
{
    public $table="page";
    public $title_field='title';

    function init()
    {
        parent::init();

        $this->addField('hash_url');
        $this->hasOne('Template');

        $this->setController('hierarchy/Table')->useField('parent_id');


        $this->addField('title')->mandatory(true);
        $this->addField('icon');
        $this->addField('is_public')->type('boolean');
        $this->addField('keywords')->type('text');
        $this->addField('content')->display(['form'=>'atk4\markdown\Form_Field_Markdown']);
        $this->addfield('settings');

        $this->addHook('beforeSave', function($m){
            $m['keywords'] = str_replace(",","\n", $m['keywords']);
            $m['keywords'] = str_replace("\n ","\n", $m['keywords']);
        });
    }

    function newSubPage(){
        $m = $this;
        if($m['parent_id'])$m=$m->ref('parent_id');
        $base_url = $m['hash_url'];
        return $m
            ->newInstance()
            ->set([
                'template_id'=>$this['template_id'],
                'is_public'=>false,
                'parent_id'=>$m->id
                ])
            ->addHook('beforeSave',function($m)use($base_url){
                setlocale(LC_ALL, 'en_US.UTF8');
                function toAscii($str, $replace=array(), $delimiter='-') {
                    if( !empty($replace) ) {
                        $str = str_replace((array)$replace, ' ', $str);
                    }

                    $clean = iconv('UTF-8', 'ASCII//TRANSLIT', $str);
                    $clean = preg_replace("/[^a-zA-Z0-9\/_|+ -]/", '', $clean);
                    $clean = strtolower(trim($clean, '-'));
                    $clean = preg_replace("/[\/_|+ -]+/", $delimiter, $clean);

                    return $clean;
                }

                $m['hash_url']=$base_url.'/'.toAscii($m['title']);
            });
    }
}
