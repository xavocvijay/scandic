<?php
class Model_Page extends Model_BaseTable {

    use Trait_DTS, Trait_RelatedEntities;

    public $table = 'page';
    public $related_entities = [
        ['Block', ['type'=>'hard', 'field'=>'page_id']],
    ];

    public $available_types = [];

    public static $edit_in_form = ['name','type','page_id'];
    public static $show_in_grid = ['name','type'];
    public static $meta_fields = ['hash_url','meta_title','meta_keywords','meta_description'];
    public static $meta_fields_for_group = ['meta_title'];

    function getAvailableTypes(){
        if(!count($this->available_types)){
            $this->available_types[''] = '<Group of pages>';
            $pages = $this->app->getConfig('atk4-home-page/page_types');
            foreach($pages as $name=>$page){
                $this->available_types[$name] = $page['descr'];
            }
        }
        return $this->available_types;
    }

    function init(){
        parent::init();

//$this->debug();
        $this->addField('name');
        $this->addField('type')->setValueList($this->getAvailableTypes());
        $this->addField('created_dts');
        $this->addField('hash_url');
        $this->addField('order');

        $this->hasOne('Page','page_id','name');

        $this->setOrder('order');

        $this->addHooks();
    }

    public function getMetaFields() {
        return ($this['type'] == '') ? self::$meta_fields_for_group : self::$meta_fields;
    }

    private function addHooks(){
        $this->createdDTS();

        $this->addHook('beforeInsert', function($m,$q){
            $q->set('hash_url', $this->generateUrlHash($m));
        });
        $this->addHook('afterLoad', function($m){
            if(isset($m['translation_id']) && is_null($m['translation_id'])){
                $m->add('Model_PageTranslation')
                    ->set([
                    'language'=>$this->app->getCurrentLanguage(),
                    'page_id'=>$m->id,
                    'meta_title'=>($m['meta_title']) ? $m['meta_title'] : $m['name'] .' - '. $this->app->getCurrentLanguage(),
                    'meta_keywords'=>$m['meta_keywords'],
                    'meta_description'=>$m['meta_description'],
                ])->saveAndUnload();
                $m->reload();
            }
        });
    }

    public function joinTranslation(){
        $join_title = $this->join('page_translation.page_id','id','left');
        $join_title->addField('translation_id','id');
        $join_title->addField('meta_title');
        $join_title->addField('meta_keywords');
        $join_title->addField('meta_description');
        $join_title->addField('language');

        return $this;
    }

    public function getForLanguage($lang){
        $this->addCondition('language',$lang);
        return $this;
    }

    public function getForCurrentLanguage(){
        $this->getForLanguage($this->app->getCurrentLanguage());
        return $this;
    }


    public function getTemplatePath(){
        if(!$this->loaded()) throw $this->exception(get_class($this).' MUST be loaded','NotLoadedModel');

        if(!$this['type']) return false;

        return $this->app->getConfig('atk4-home-page/page_types/'.$this['type'].'/template',false);
    }

    public function getForMenu() {
        $this->addExpression('url_first_child',function($m){
            $f = $m->add('Model_Page',['table_alias'=>'p2'])->addCondition('page_id',$m->getElement('id'));
            $f->setLimit(1);
            return $f->fieldQuery('hash_url');
        });
        return $this;
    }

    public function getTop(){
        $this->addCondition('page_id',null);
        return $this;
    }

    public function getSiblings() {
        if(!$this->loaded()) throw $this->exception(get_class($this).' MUST be loaded','NotLoadedModel');
        if($this['page_id']) {
            $p = $this->add('Model_Page');
            $p->addCondition('page_id',$this['page_id']);
            return $p;
        } else {
            return false;
        }
    }

    public function create($data){
        if($this->loaded()) throw $this->exception(get_class($this).' MUST NOT be loaded','LoadedModel');

        //validation
        $fields_errors = [];
        //TODO
        //Check existence
        if(!isset($data['title']) || !$data['title']) $fields_errors['title'] = $this->exception('Page title is empty','NoTitle');
//        if(!isset($data['menu_type']) || !$data['menu_type']) $fields_errors['menu_type'] = $this->exception('Page menu type is empty','NoMenuType');
        if(!isset($data['type']) || !$data['type']) $fields_errors['type'] = $this->exception('Page type is empty','NoType');
        if(!isset($data['has_content'])) $fields_errors['has_content'] = $this->exception('Page has content value is empty','NoHasContent');
//        if(!isset($data['has_sub_pages'])) $fields_errors['has_sub_pages'] = $this->exception('Page has sub pages value is empty','NoHasSubPages');
        //Check values
//        if(!in_array($data['menu_type'],self::$available_menu_types)) $fields_errors['menu_type'] = $this->exception('Incorrect Page Menu Type','UnsupportedMenuType');
        if(!in_array($data['type'],self::$available_types)) $fields_errors['type'] = $this->exception('Incorrect Page Type','UnsupportedType');
        //Check types
        if(!is_string($data['title'])) $fields_errors['title'] = $this->exception('Incorrect value type','IncorrectValueType');
        if(!is_int($data['has_content'])) $fields_errors['has_content'] = $this->exception('Incorrect value type','IncorrectValueType');
//        if(!is_int($data['has_sub_pages'])) $fields_errors['has_sub_pages'] = $this->exception('Incorrect value type','IncorrectValueType');

        if($fields_errors) throw $this->exception('Invalid Field','InvalidField')->setArray($fields_errors);

        try{
            $this->set($data)->save();
        }catch (Exception $e){
            throw $this->exception('Can not create new Page '.$e->getMessage(),'CanNotSave');
        }
        return $this;
    }



    public function generateUrlHash($m) {
        $str = strtolower($m->get('meta_title'));
        // заменям все ненужное нам на "-"
        $str = preg_replace('~[^-a-z0-9_]+~u', '-', $str);
        // удаляем начальные и конечные '-'
        $str = trim($str, "-");

        return $str;
    }

    public function getSubPages(){
        if(!$this->loaded()) throw $this->exception(get_class($this).' MUST be loaded','NotLoadedModel');
        $m = $this->add(get_class($this));
        $m->addCondition('page_id',$this->id)->deleted($this['is_deleted']);
        return $m;
    }

    public function getBlocks($as_array=false,$limit=false,$offset=0,$order=false,$desc=true) {
        $bc = $this->add('Model_Block')->deleted($this['is_deleted'])->addCondition('page_id',$this->id);
        return $this->prepareRelated($bc,$as_array,$limit,$offset,$order,$desc);
    }
}