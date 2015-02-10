<?php
/**
 * Created by PhpStorm.
 * User: vadym
 * Date: 16/01/15
 * Time: 17:21
 *
 * This is base test for all business logic tests
 *
 */
abstract class BLBaseTest extends PHPUnit_Framework_TestCase {

    use Proxy;

    protected $config;

    public function setUp() {
        $this->config = new Config();
        $this->addApp();
    }

    protected function addApp()
    {
        $this->app = new App_CLI();
        $this->app->pathfinder->addLocation(array(
            'addons'=>array('atk4-addons','addons','vendor'),
            'php'=>array('shared','shared/lib','../lib'),
            'mail'=>array('templates/mail'),
        ))->setBasePath('.');
        $this->app->environment = 'test';
        $this->app->dbConnect();
        $this->app->logger = $this->app->add('Logger');
        $this->app->page = '';
        $this->app->add('Auth')
            ->usePasswordEncryption('md5')
            ->setModel('Model_User', 'email', 'password')
        ;

        return $this->app;
    }

    /*public function testQWE(){
        //This is dummy test. Without is tests don't work
        $this->assertTrue(true);
    }*/

    public function tearDown() {}

}