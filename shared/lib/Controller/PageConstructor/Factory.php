<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 11.02.15
 * Time: 17:40
 */
class Controller_PageConstructor_Factory extends AbstractController{
    public function getByType(AbstractView $view, $type, $app_type = '', array $options=[], $spot=null){
        $options['app_type'] = $app_type;
        switch($type){
            case Model_Page::TWO_COLUMNS_MENU:
                return $view->add('View_PageConstructor_TCM',$options,$spot);
                break;
            case Model_Page::ONE_COLUMN_MENU:
                return $view->add('View_PageConstructor_OCM',$options,$spot);
                break;
            case Model_Page::ONE_COLUMN:
                return $view->add('View_PageConstructor_TCM',$options,$spot);
                break;
            case Model_Page::ONE_COLUMN_BIG_BLOCKS:
                return $view->add('View_PageConstructor_TCM',$options,$spot);
                break;
            case Model_Page::NO_BLOCKS:
                return $view->add('View_PageConstructor_TCM',$options,$spot);
                break;
            default:
                throw $this->exception('Type ['.$type.'] is not supported','UnsupportedType');
        }
    }
}