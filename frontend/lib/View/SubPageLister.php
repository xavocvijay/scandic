<?php
class View_SubPageLister extends CompleteLister {
    public $cnt = 0;
    function formatRow(){
        if($this->cnt && !($this->cnt % 4)){
            $this->template->appendHTML(
            $this->container_tag,
            '</div><div class="atk-cells atk-stack-mobile">'
        );

        }

        $this->cnt++;
        return parent::formatRow();
    }
}
