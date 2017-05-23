<?php


/**
* 
*/
class Model_About_Content extends SQL_Model{
	public $table = "about_contents";	
	function init(){
		parent::init();
		$this->addField('content')->type('text');

		$this->hasMany('About_ContentImages','content_id');
	}
}