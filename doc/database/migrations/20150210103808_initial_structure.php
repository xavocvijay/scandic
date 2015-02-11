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
        $table = $this->table('settings');
        $table
            ->addColumn('key', 'string',['limit'=>'255','null'=>false])
            ->addColumn('value', 'string',['limit'=>'255','null'=>false])
            ->create();

        $table = $this->table('user');
        $table
            ->addColumn('email', 'string',['limit'=>'255','null'=>false])
            ->addColumn('password', 'string',['limit'=>'255','null'=>false])
            ->addColumn('name', 'string',['limit'=>'255','null'=>true])
            ->addColumn('created_dts', 'datetime',['null'=>false])
            ->addColumn('is_deleted', 'integer',['null'=>false,'default'=>'0'])
            ->create();

        $table = $this->table('page');
        $table
            ->addColumn('title', 'string',['limit'=>'255','null'=>false])
            ->addColumn('menu_type', 'string',['limit'=>'255','null'=>false])
            ->addColumn('type', 'string',['limit'=>'255','null'=>false])
            ->addColumn('has_content', 'integer',['null'=>false,'default'=>'0'])
            ->addColumn('has_sub_pages', 'integer',['null'=>false,'default'=>'0'])
            ->addColumn('hash_url', 'string',['limit'=>'255','null'=>false])
            ->addColumn('order', 'integer',['limit'=>'11','null'=>true,'default'=>null])
            ->addColumn('meta_keywords', 'string',['limit'=>'255','null'=>true,'default'=>null])
            ->addColumn('meta_description', 'string',['limit'=>'255','null'=>true,'default'=>null])
            ->addColumn('created_dts', 'datetime',['null'=>false])
            ->addColumn('is_deleted', 'integer',['null'=>false,'default'=>'0'])
            ->addColumn('page_id', 'integer',['limit'=>'11','null'=>false])
            ->create();

        $table = $this->table('block');
        $table
            ->addColumn('system_name', 'string',['limit'=>'255','null'=>false])
            ->addColumn('type', 'string',['limit'=>'255','null'=>false])
            ->addColumn('content', 'text',['null'=>true,'default'=>null])
            ->addColumn('page_id', 'integer',['limit'=>'11','null'=>false])
            ->addColumn('order', 'integer',['limit'=>'11','null'=>true,'default'=>null])
            ->addColumn('language_id', 'integer',['limit'=>'11','null'=>false])
            ->addColumn('created_dts', 'datetime',['null'=>false])
            ->addColumn('is_deleted', 'integer',['null'=>false,'default'=>'0'])
            ->create();

        $table = $this->table('language');
        $table
            ->addColumn('lang_code', 'string',['limit'=>'255','null'=>false])
            ->create();

        $table = $this->table('search');
        $table
            ->addColumn('content', 'string',['limit'=>'255','null'=>false])
            ->addColumn('block_id', 'integer',['limit'=>'11','null'=>false])
            ->create();
    }

    /**
     * Migrate Down.
     */
    public function down()
    {
        $table = $this->table('settings');
        $table->drop();

        $table = $this->table('user');
        $table->drop();

        $table = $this->table('page');
        $table->drop();

        $table = $this->table('block');
        $table->drop();

        $table = $this->table('language');
        $table->drop();

        $table = $this->table('search');
        $table->drop();
    }
}