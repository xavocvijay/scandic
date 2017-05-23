<?php


/**
* 
*/
class Model_About_ContentImages extends SQL_Model{
	public $table = "about_content_images";	
	function init(){
		parent::init();
		$this->hasOne('About_Content','content_id');
		$this->add('filestore/Field_Image','image_id');

	}
}