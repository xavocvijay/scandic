<?php

/**
 * This controller will allow you to re-order elements in your grid with
 * drag-and-dropping. Currently it's not tested with pagination.
 *
 * $grid->setController('OrderedGrid');
 *
 * You can also use it with Lister/CompleteLister but you
 * may need to specify $record_selector and $data_id propeties:
 *
 * $myLister->seController('OrderedGrid', ['record_selector'=>'div.row']);
 */
class Controller_OrderedGrid extends AbstractController {

    /**
     * Field to use for ordering
     */
    protected $ord_field = 'ord';

    protected $record_selector = 'tbody>tr';

    protected $data_id = 'data-id';

    protected $view = null;

    /**
     * Virtpal page's URL will be used to save ordering.
     */
    public $vp;


    function init(){
        parent::init();

        // You can override the view
        if(is_null($this->view)){
            $this->view = $this->owner;
        }

        if(!$this->view instanceof View) {
            throw $this->exception('Add this controller inside a Grid');
        }

        if($this->view instanceof Grid) {
            $this->view->add('View',null,'quick_search')->set('Drag items to Re-Order')->addClass('atk-label atk-effect-info atk-move-right');
        }

        $this->view->model->setOrder($this->ord_field);

        // Virtual page will handle re-ordering event
        $this->createVirtualPage();

        // Load our JavaScript helper
        $this->view->js(true)
            ->_load('orderedGrid')
            ->orderedGrid(
                $this->vp->getURL(),
                [ 'items' => 'tbody>tr' ]
            );

    }

    /**
     * This method creates a reordering handler inside a Virtual Page.
     *
     * Override this if you want to store order differently.
     */
    protected function createVirtualPage(){
        $this->vp = $this->view->add('VirtualPage');
        $this->vp->set(array($this, 'saveOrder'));
    }


    /**
     * Will be called by virtual page
     */
    function saveOrder(){
        // Using $this->view->model
        $o = (array)$_POST['order'];
        $order = array_flip($o);

        $m = $this->view->model->newInstance();
        $m->addCondition('id',$o);

        foreach ($m as $row) {
            $row->set($this->ord_field,(int)$order[$row->id])->saveAndUnload();
        }

        return $this->app->js()->univ()->successMessage(join(', ',$order))->execute();
    }
}
