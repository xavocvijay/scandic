    <?php
class View_Actions extends View {
    function init(){
        parent::init();
    }
    function setModel($m){
        $m = parent::setModel($m);

        if($m['action2_id']){
            foreach([1,2] as $x){
                if($m['action'.$x.'_id']){
                    $this->add('View',null,'Action'.$x,'Action'.$x)->setModel($m->ref('action'.$x.'_id'));
                }
            }
            $this->template->tryDel('ActionSingle');
        }else{
            $this->add('View',null,'ActionSingle','ActionSingle')->setModel($m->ref('action1_id'));

            $this->template->tryDel('ActionMulti');
        }
    }
}
