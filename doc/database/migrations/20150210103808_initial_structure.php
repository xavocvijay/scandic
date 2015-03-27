<?php

use Phinx\Migration\AbstractMigration;

class InitialStructure extends AbstractMigration
{
    /**
     * Change Method.
     *
     * More information on this method is available here:
     * http://docs.phinx.org/en/latest/migrations.html#the-change-method
     *
     * Uncomment this method if you would like to use it.
     *
    public function change()
    {
    }
    */
    
    /**
     * Migrate Up.
     */
    public function up()
    {
        $this->table('settings')
            ->addColumn('key', 'string',['limit'=>'255','null'=>false])
            ->addColumn('value', 'string',['limit'=>'255','null'=>false])
            ->create();

        $this->table('user')
            ->addColumn('email', 'string',['limit'=>'255','null'=>false])
            ->addColumn('password', 'string',['limit'=>'255','null'=>false])
            ->addColumn('name', 'string',['limit'=>'255','null'=>true])
            ->addColumn('created_dts', 'datetime',['null'=>false])
            ->addColumn('is_deleted', 'integer',['null'=>false,'default'=>'0'])
            ->create();

    }

    /**
     * Migrate Down.
     */
    public function down()
    {
        $this->table('settings')->drop();
		$this->table('user')->drop();

    }
}