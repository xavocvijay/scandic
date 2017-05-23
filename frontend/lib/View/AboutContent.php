<?php


/**
* 
*/
class View_AboutContent extends View{
	public $content_m = null;	
	
	function init(){
		parent::init();		
			
		$image = $this->add('Model_About_ContentImages');
		$image->addCondition('content_id',$this->content_m->id);
		$l = $this->add('CompleteLister',null,null,['view\about_content']);
		$l->setModel($image);
		$l->template->trySet('content',$this->content_m['content']);
	}

}