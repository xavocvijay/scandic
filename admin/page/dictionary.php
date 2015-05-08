<?php
/**
 * Page class
 */
class page_dictionary extends Page
{
    public $title='Dictionary';

    function init()
    {
        parent::init();

        // Fixing improper implementation of Markdown JS
        $f = $this->add('Form');
        $f->addStyle('display','none');
        $f->setModel('Dictionary');

        $this->add('CRUD')->setModel('Dictionary');

    }
}
