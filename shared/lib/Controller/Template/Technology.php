<?php
class Controller_Template_Technology extends Controller_Template_Multipage {
    public $title='Technology';
    public $show_settings=false;
    function forAdminIndex($page){

        $t = $page->tabs->addTab('Technologies');

        $cr = $t->add('CRUD');
        $cr->setModel('Technology');
        $cr->grid->add('Controller_OrderedGrid');

        // $cr->grid->addColumn('Expander','duplicatetechnology',' Copy');
        $copy_btn = $cr->grid->addColumn('Button','Copy');

        if($_GET['Copy']){
            $technology_m = $this->add('Model_Technology');   
            $technology_m->addCondition('id',$_GET['Copy']);
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
           $copy_btn->js('click',$cr->js()->univ()->successMessage('Record Duplicated'))->reload(['cut_page'=>0])->execute(); 
        }


    }


    function forModel($m){
        $m->getElement('content')->display(['form'=>'text']);
        $this->setModel($m->reload());
    }

    function forFrontend($page){
        parent::forFrontend($page);

        // $left_l = $page->add('CompleteLister',null,'Left','Left');
        // $left_l->setModel('Technology')->loadBy('position','left');
        
        // $left_l->addHook('formatRow',function($l){
        //     $l->current_row_html['block_position'] = $l->model['position'];
        //     $l->current_row_html['bullets']="<li>".join("</li><li>",explode("\n", $l->current_row['bullets']))."</li>";
        //     if($l->current_row['class']=='step-3'){
        //         $l->current_row['bottom_connector']='';
        //     }
        //     if($l->model['connection'] == 'topbottom'){
        //         $l->current_row_html['connection_wrapper']='';
        //         $l->current_row_html['connection_point']='';
        //     }else{
        //         $l->current_row_html['dro_top_bottom_conntection_wrapper']='';
        //         $l->current_row_html['connection_lines']=$l->model['connection'];
        //         $l->current_row_html['connection_point']=$l->model['connection'];
        //     }
        // });

        // $right_l = $page->add('CompleteLister',null,'Right','Right');
        // $right_l->setModel('Technology')->addCondition('position','right');
        // $right_l->addHook('formatRow',function($l){
        //     $l->current_row_html['block_position'] = $l->model['position'];
        //     $l->current_row_html['bullets']="<li>".join("</li><li>",explode("\n", $l->current_row['bullets']))."</li>";
        //     if($l->current_row['class']=='step-3'){
        //         $l->current_row['bottom_connector']='';
        //     }            
        // });

        $cl = $page->add('CompleteLister',null,'Center','Center');
        $cl->setModel('Technology');//->addCondition('position','center');

        $f = function($l){
            if($l->model['bullets']){
                $l->current_row_html['bullets']="<li>".join("</li><li>",explode("\n", $l->current_row['bullets']))."</li>";
            }else{
                $l->current_row['bullets_wrapper']='';
            }
            if($l->model['image_id']){
                $l->current_row['block_image']=$l->model['image'];
            }else{
                $l->current_row['image_wrapper']="";
            }

            if($l->current_row['class']=='step-3'){
                $l->current_row['bottom_connector']='';
            }
            $l->current_row_html['image_position'] = $l->model['image_position'];
            $l->current_row_html['block_position'] = $l->model['position'];

            if($l->model['position'] === 'center'){
                $l->current_row_html['atk-clear-fix_before'] = "<div class='atk-clear-fix'></div>";
                $l->current_row_html['atk-clear-fix_after'] = "<div class='atk-clear-fix'></div>";
            }else{
                $l->current_row_html['atk-clear-fix_before'] = " ";
                $l->current_row_html['atk-clear-fix_after'] = " ";
            }

            if($l->model['connection'] === 'topbottom'){
                $l->current_row_html['connection_wrapper']='';
                $l->current_row_html['connection_point_wrapper']='';
                // $l->current_row_html['connection_lines']='';
                $l->current_row_html['dro_top_bottom_conntection_wrapper']='<div class="point atk-shape-circle point-top"></div><div class="point atk-shape-circle point-bottom"></div><div class="connection connection-top"></div><div class="connection connection-bottom"></div>';
            }else{
                $l->current_row_html['connection_wrapper']='<div class="connection connection-'.$l->model['connection'].'"></div>';
                $l->current_row_html['dro_top_bottom_conntection_wrapper']='';
                $l->current_row_html['connection_point']=$l->model['connection'];
                $l->current_row_html['connection_point_wrapper']='<div class=" point atk-shape-circle point-'.$l->model['connection'].'"></div>';
            }
        };

        $cl->addHook('formatRow', $f);
    }


}

class ViewBullets extends View {
    function render(){
        $this->template->setHTML('bullets_html',"<li>".join("</li><li>",explode("\n", $this->model['bullets'])))."</li>";
        parent::render();
    }

}
