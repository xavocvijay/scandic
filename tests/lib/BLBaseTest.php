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

    protected $current_user;
    protected $config;

    public function setUp() {
        $this->config = new Config();
        $this->addApp();
        $this->createUser();
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

    protected function createUser() {

        $user_hash = time();
        $data = [
            'name'=> 'TestUser_'.$user_hash,
            'email'=> 'tu_'.$user_hash,
            'password'=>'123123'
        ];

        $this->current_user = $this->app->add('Model_User');
        $this->current_user->create($data);

        $this->assertTrue($this->current_user->loaded(), 'User has not been saved');
        $this->assertEquals($data['name'], $this->current_user['name'], 'User name does not match');
        $this->assertEquals($data['email'], $this->current_user['email'], 'User email does not match');

        return $this->current_user;
    }

    public function tearDown() {
        $this->current_user->forceDelete();
    }

}