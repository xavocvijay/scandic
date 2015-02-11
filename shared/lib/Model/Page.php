<?php
class Model_Page extends Model_BaseTable {

    use Trait_DTS, Trait_RelatedEntities;

    public $table = 'page';
    public $related_entities = [
        ['Block', ['type'=>'hard', 'field'=>'page_id']],
    ];
    const TWO_COLUMNS_MENU = 'two_columns_menu';
    const ONE_COLUMN_MENU = 'one_column_menu';
    const ONE_COLUMN = 'one_column';
    const ONE_COLUMN_BIG_BLOCKS = 'one_column_big_blocks';
    public static $available_types = [
        self::TWO_COLUMNS_MENU=>'Two columns text with left menu',
        self::ONE_COLUMN_MENU=>'One column text with left menu and blocks',
        self::ONE_COLUMN=>'One column without menu blocks',
        self::ONE_COLUMN_BIG_BLOCKS=>'One column without menu big blocks'
    ];

    const MENU_TYPE_TOP = 'top';
    const MENU_TYPE_SUB = 'sub';
    public static $available_menu_types = [self::MENU_TYPE_TOP=>'Top Menu',self::MENU_TYPE_SUB=>'Sub Menu'];
    public static $edit_in_form = ['title','menu_type','type','page_id','has_content','has_sub_pages','hash_url','meta_keywords','meta_description'];
    public static $show_in_crud = ['title','menu_type','type','has_content','has_sub_pages'];

    function init(){
        parent::init();

        $this->addField('title');
        $this->addField('menu_type')->setValueList(static::$available_menu_types);
        $this->addField('type')->setValueList(static::$available_types);
        $this->addField('has_content')->type('boolean');
        $this->addField('has_sub_pages')->type('boolean');
        $this->addField('created_dts');
        $this->addField('hash_url');
        $this->addField('order');
        $this->addField('meta_keywords')->type('text');
        $this->addField('meta_description')->type('text');
        $this->hasOne('Page','page_id','title');

        $this->addHooks();
    }

    public function getTop(){
        $this->addCondition('menu_type',self::MENU_TYPE_TOP);
        return $this;
    }

    public function create($data){
        if($this->loaded()) throw $this->exception(get_class($this).' MUST NOT be loaded','LoadedModel');

        //validation
        $fields_errors = [];
        //TODO
        //Check existence
        if(!isset($data['title']) || !$data['title']) $fields_errors['title'] = $this->exception('Page title is empty','NoTitle');
        if(!isset($data['menu_type']) || !$data['menu_type']) $fields_errors['menu_type'] = $this->exception('Page menu type is empty','NoMenuType');
        if(!isset($data['type']) || !$data['type']) $fields_errors['type'] = $this->exception('Page type is empty','NoType');
        if(!isset($data['has_content'])) $fields_errors['has_content'] = $this->exception('Page has content value is empty','NoHasContent');
        if(!isset($data['has_sub_pages'])) $fields_errors['has_sub_pages'] = $this->exception('Page has sub pages value is empty','NoHasSubPages');
        //Check values
        if(!in_array($data['menu_type'],self::$available_menu_types)) $fields_errors['menu_type'] = $this->exception('Incorrect Page Menu Type','UnsupportedMenuType');
        if(!in_array($data['type'],self::$available_types)) $fields_errors['type'] = $this->exception('Incorrect Page Type','UnsupportedType');
        //Check types
        if(!is_string($data['title'])) $fields_errors['title'] = $this->exception('Incorrect value type','IncorrectValueType');
        if(!is_int($data['has_content'])) $fields_errors['has_content'] = $this->exception('Incorrect value type','IncorrectValueType');
        if(!is_int($data['has_sub_pages'])) $fields_errors['has_sub_pages'] = $this->exception('Incorrect value type','IncorrectValueType');

        if($fields_errors) throw $this->exception('Invalid Field','InvalidField')->setArray($fields_errors);

        try{
            $this->set($data)->save();
        }catch (Exception $e){
            throw $this->exception('Can not create new Page '.$e->getMessage(),'CanNotSave');
        }
        return $this;
    }

    private function addHooks(){
        $this->createdDTS();
    }


    public function getBlocks($as_array=false,$limit=false,$offset=0,$order=false,$desc=true) {
        $bc = $this->add('Model_Block')->deleted($this['is_deleted'])->addCondition('page_id',$this->id);
        return $this->prepareRelated($bc,$as_array,$limit,$offset,$order,$desc);
    }
}