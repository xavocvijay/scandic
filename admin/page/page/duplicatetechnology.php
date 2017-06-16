<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 10.02.15
 * Time: 11:25
 */
class page_page_duplicatetechnology extends Page{
    function init(){
        parent::init();
        $technology_id = $this->app->stickyGET('technology_id');
        // throw new \Exception($technology_id, 1);
        
        $technology_m = $this->add('Model_Technology');   
        $technology_m->addCondition('id',$technology_id);
        $technology_m->tryLoadAny();
        if($technology_m->loaded()){
	        $this->add('Model_Technology')
	        	->set('name',$technology_m['name'])
	        	->set('position',$technology_m['position'])
	        	->set('content',$technology_m['content'])
	        	->set('bullets',$technology_m['bullets'])
	        	->set('class',$technology_m['class'])
	        	->set('connection',$technology_m['connection'])
	        	->set('ord',$technology_m['ord'])
	        	->set('image_id',$technology_m['image_id'])
	        	->set('image_position',$technology_m['image_position'])
	        	->save();

        }
	      $this->js(null,$this->js()->univ()->successMessage('Record Duplicated'))->reload();
        
    }
}
