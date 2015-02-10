<?php

return;
class BLUserTest extends BLBaseTest
{

    protected $user;
    protected $page;
    protected $block;

    use Trait_CreateEntities;

    public function tearDown()
    {
        parent::tearDown();
        $this->user->forceDelete();
    }

    protected function createUserTest()
    {
        $this->user = $this->createUser();


    }


}



/*


        try {
            $user->forceDelete();
        } catch (Exception $e) {
            echo $e->getMessage()."\n";
            echo $e->getFile()."\n";
            echo $e->getLine()."\n";
            echo $e->getTraceAsString();

        }


 */