<?php

class Model_BaseTable extends Model_Table {
    public $related_entities;
    public $soft_deleted_id = null;
    public $hard_deleted_id = null;

    public function init(){
        parent::init();
        $this->addField('is_deleted');//->type('boolean');
    }

    /**
     * Cascade restoring of related entities
     * @param null $id
     * @return $this
     * @throws AbstractObject
     * @throws BaseException
     */
    public function restore($id=null){
        if(!is_null($id))$this->load($id);
        if(!$this->loaded())throw $this->exception('Unable to determine which record to restore','NotLoadedModel');

        if(!isset($this->related_entities)) throw $this->exception('Related entities are not specified', 'NoRelatedEntities');

        foreach($this->related_entities as $related_entity){
            $model_arr = $this
                ->add('Model_'.$related_entity[0])
                ->addCondition($related_entity[1]['field'], $this->id)
                ->deleted();
            foreach($model_arr as $record){
                $record->restore();
            }
        }

        $restored_id = $this->id;
        $this->removeCondition('is_deleted');
        $this['is_deleted'] = 0;
        $this->saveAndUnload();
        $this->load($restored_id);
        return $this;
    }




    public function deleted($yes=true) {

        if(is_bool($yes)){
            $yes = $yes?1:0;
        }

        $this->addCondition('is_deleted',$yes);
        return $this;
    }




    /**
     * cascade soft deleting of related entities
     * @param null $id
     * @return $this
     * @throws AbstractObject
     * @throws BaseException
     */
    function delete($id=null){
        if(!is_null($id))$this->load($id);
        if(!$this->loaded())throw $this->exception('Unable to determine which record to delete','NotLoadedModel');

        //Delete related entities
        if(!isset($this->related_entities)) throw $this->exception('Related entities are not specified', 'NoRelatedEntities');
        foreach($this->related_entities as $related_entity){
            $model_arr = $this
                ->add('Model_'.$related_entity[0])
                ->addCondition($related_entity[1]['field'], $this->id)
                ->deleted(false);
            foreach($model_arr as $record){
                $record->delete();
            }
        }

        $this->soft_deleted_id = $this->id;
        //Delete current entity
        $this->hook('beforeDelete',array($this->_dsql()));
        $this->set('is_deleted',1)->saveAndUnload();
        $this->hook('afterDelete');

        return $this;
    }

    /**
     * Cascade hard deleting of related entities
     * @param null $id
     * @return $this
     * @throws AbstractObject
     * @throws BaseException
     */
    function forceDelete($id=null){
        //Delete related entities
        if(!isset($this->related_entities)) throw $this->exception('Related entities are not specified', 'NoRelatedEntities');
        foreach($this->related_entities as $related_entity){
            $model = $this
                ->add('Model_'.$related_entity[0])
                ->addCondition($related_entity[1]['field'], $this->id);
			foreach($model as $record){
                if($related_entity[1]['type'] == 'soft'){
                    $record->delete();
				}else{
                    $record->forceDelete();
				}
            }
            
        }

        if($id){
            $this->hard_deleted_id = $id;
        }else{
            $this->hard_deleted_id = $this->id;
        }
        //Delete current entity
        return parent::delete($id);
    }
    function removeCondition($field,$kind='where',$system=false,$editable=true){
        // get model field object
        if(!$field instanceof Field){
            $field=$this->getElement($field);
        }
        foreach($this->_dsql()->args[$kind] as $k=>$v){
            if ($v[0]==$this->table.'.'.$field->short_name){
                unset($this->_dsql()->args[$kind][$k]);
            }
        }
        $this->getElement($field->short_name)->system($system)->editable($editable);
    }

    function listConditions(){
        foreach($this->_dsql()->args['where'] as $k=>$v){
            var_dump($v);
        }
    }
}
