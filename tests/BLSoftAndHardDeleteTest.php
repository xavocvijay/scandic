<?php

return;
class BLSoftAndHardDeleteTest extends BLBaseTest {

    protected $user;
    protected $page;
    protected $block;

    use Trait_CreateEntities;

    public function tearDown() {
        parent::tearDown();
    }

    public function testAddAllRequitedEntities() {
        $this->company = $this->createCompany();
        $this->checkUser($this->user);
        $this->inviteMoreUsers();
        $this->createMarket($this->company);
        $this->createProvider($this->company);
        $this->createPage($this->company);
        $deleted_company = $this->softDeleteCompany($this->company);
        $restored_company = $this->restoreCompany($deleted_company);
        $this->hardDeleteCompany($restored_company);
    }

    private function inviteMoreUsers(){
        // invite more user to same company
        $hash = substr(md5(microtime()),0,5);
        for ($i=1; $i<=4; $i++) {
            $user_email = $hash."_$i@test.com";
            $invite = $this->user->invite($user_email);
            $var_name = 'user_'.$i;
            $this->{$var_name} = $this->registerUser($invite);
            $this->checkUser($this->{$var_name}, $invite);
        }
    }

    private function checkUser(Model_User $user, Model_Invite $invite=null) {

        if ($invite) {
            // load inviter
            $inviter = $this->app->add('Model_User')->deleted(false)->tryLoad($invite['user_id']);
            $this->assertTrue($inviter->loaded(),'Inviter with ID '.$invite['user_id'].' cannot be loaded. Invitation ID '.$invite->id);

            // load company
            $company = $this->app->add('Model_Company')->deleted(false)->tryLoad($inviter['company_id']);
            $this->assertTrue($company->loaded(),'Company with ID '.$invite['company_id'].' cannot be loaded. Company owner ID '.$inviter->id);
            $this->assertEquals($company['user_id'],$inviter->id,'Inviter is not an owner of company he belongs to.');
        } else {

            $company = $this->app->add('Model_Company')->deleted(false)->tryLoad($user['company_id']);
            $this->assertTrue($company->loaded(),'Company with ID '.$user['company_id'].' cannot be loaded.');

            // try to find invitation
            $invite = $this->app->add('Model_Invite')->deleted(false)->tryLoadBy('invited_user_id',$user->id);
            if ($invite->loaded()) {
                // if user was invited he cannot be owner of company
                $this->assertNotEquals($company['user_id'],$user->id,'User with ID '.$user->id.' cannot be owner of company with ID '.$company->id);
            } else {
                // if there is no invite that means user is an owner of company
                $this->assertEquals($company['user_id'],$user->id,'User is not an owner of company he belongs to.');
            }
        }

    }

    private function softDeleteCompany(Model_Company $company) {

        $company_id = $company->id;
        $company->delete(); // this is soft delete
        $company_check = $this->app->add('Model_Company')->deleted(true)->load($company_id);

        $this->assertEquals($company_check['is_deleted'],1);

        $owner = $this->app->add('Model_User')->deleted(true)->load($company_check['user_id']);
        $this->assertEquals($owner['is_deleted'],1);

        $employees = $this->app->add('Model_User')
            ->deleted(true)
            ->addCondition('company_id',$company_check->id)
            ->addCondition('id','<>',$owner->id)
        ;

        $last_id = false;
        foreach ($employees as $k=>$m) {
            if ($last_id) $this->assertNotEquals($m->id,$last_id); // check if iterator works fine
            $this->assertEquals($m['is_deleted'],1);
            $last_id = $m->id;
        }

        return $company_check;
    }

    private function restoreCompany(Model_Company $company) {

        $company->restore(); // this is soft delete

        $this->assertEquals($company['is_deleted'],0);

        $owner = $this->app->add('Model_User')->deleted(false)->load($company['user_id']);
        $this->assertEquals($owner['is_deleted'],0);

        $employees = $this->app->add('Model_User')
            ->deleted(false)
            ->addCondition('company_id',$company->id)
            ->addCondition('id','<>',$owner->id)
        ;

        $last_id = false;
        foreach ($employees as $k=>$m) {
            if ($last_id) $this->assertNotEquals($m->id,$last_id); // check if iterator works fine
            $this->assertEquals($m['is_deleted'],0);
            $last_id = $m->id;
        }

        return $company;
    }
    private function hardDeleteCompany(Model_Company $company) {
        $company_id = $company->id;

        $company->forceDelete();

        $this->assertFalse($company->loaded(),'Company has not been deleted');

        foreach($company->related_entities as $related_entity){
            $model_arr = $this->app
                ->add('Model_'.$related_entity[0])
                ->addCondition($related_entity[1]['field'], $company_id)->getRows();

            $this->assertEquals(0,count($model_arr),'Related entities have not been deleted');
        }
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