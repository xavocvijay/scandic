<?php

abstract class Menu_Advanced extends View
{
    public $swatch=null;
    public $hover_swatch=null;

    /**
     * Adds a title to your menu.
     */

    public function addTitle($title, $class = 'Menu_Advanced_Title')
    {
        $i = $this->add($class,null,null,
            array_merge($this->defaultTemplate(),array('Title'))
        );

        $i->set($title);

        return $i;
    }

    public function addItem($title, $action=null, $class='Menu_Advanced_Item')
    {
        $i = $this->add($class,null,null,
            array_merge($this->defaultTemplate(),array('Item'))
        );

        if (is_array($title)) {

            if ($title['badge']) {
                $i->add('View',null,'Badge')
                    ->setElement('span')
                    ->addClass('atk-label')
                    ->set($title['badge']);
                unset($title['badge']);
            }

        }

        if ($action) {
            if (is_string($action) || is_array($action) || $action instanceof URL) {
                $i->template->set('url',$url = $this->api->url($action));
                if($url->isCurrent(true)){
                    $i->addClass('active');
                }
            } else {
                $this->on('click',$action);
            }
        }

        $i->setHtml($title);

        return $i;
    }

    public function addMenu($title, $class=null, $options=array())
    {
        if(is_null($class))$class='Menu_Vertical';
        if($class=='Horizontal')$class='Menu_Horizontal';

        $i = $this->add('Menu_Advanced_Item',null,null,
            array_merge($this->defaultTemplate(),array('Menu'))
        );
        $i->setHtml(is_array($title)?$title[0]:$title);

        $m = $i->add($class,null,'SubMenu');

        return $m;
    }

    public function addSeparator($class='Menu_Advanced_Separator')
    {
        $i = $this->add($class,null,null,
            $x=array_merge($this->defaultTemplate(),array('Separator'))
        );

        return $i;
    }

    public function setModel($m, $options=array())
    {
        $m=parent::setModel($m);
        foreach ($m as $model) {

            // check subitems
            if (@$model->hierarchy_controller && $model[strtolower($model->hierarchy_controller->child_ref).'_cnt']) {
                $m=$this->addMenu($model[$options['title_field']?:'name']);
                foreach ($model->ref($model->hierarchy_controller->child_ref) as $child) {
                    $m->addItem($options['title_field']?:$child['name'],$child['page']);
                }

            } else {

                $this->addItem($model['name'],$model['page']);

            }

        }
        return $this->model;
    }

    // compatibility
    public function addMenuItem($page,$label=null)
    {
        if (!$label) {
            $label=ucwords(str_replace('_',' ',$page));
        }

        return $this->addItem($label,$page);

    }
    public function addLabel($label)
    {
        return $this->addTitle($label);
    }

}
