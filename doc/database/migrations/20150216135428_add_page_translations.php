<?php

use Phinx\Migration\AbstractMigration;

class AddPageTranslations extends AbstractMigration
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
        $table = $this->table('page_translation');
        $table
            ->addColumn('page_id', 'integer',['limit'=>'11','null'=>false])
            ->addColumn('language', 'string',['limit'=>'25','null'=>false])
            ->addColumn('meta_title', 'string',['limit'=>'255','null'=>false])
            ->addColumn('meta_keywords', 'string',['limit'=>'255','null'=>true,'default'=>null])
            ->addColumn('meta_description', 'string',['limit'=>'255','null'=>true,'default'=>null])
            ->create();

        $table = $this->table('page');
        $table->removeColumn('menu_type');
        $table->removeColumn('has_content');
        $table->removeColumn('has_sub_pages');
        $table->removeColumn('meta_keywords');
        $table->removeColumn('meta_description');
        $table->renameColumn('title','name');

        $this->execute('ALTER TABLE `page` MODIFY `type` VARCHAR(255) NULL DEFAULT NULL;');

        $table = $this->table('block');
        $table->renameColumn('language_id','language');
    }

    /**
     * Migrate Down.
     */
    public function down()
    {
        $table = $this->table('page_translation');
        $table->drop();

        $table = $this->table('page');
        $table
            ->addColumn('menu_type', 'string',['limit'=>'255','null'=>false])
            ->addColumn('has_content', 'integer',['null'=>false,'default'=>'0'])
            ->addColumn('has_sub_pages', 'integer',['null'=>false,'default'=>'0'])
            ->addColumn('meta_keywords', 'string',['limit'=>'255','null'=>true,'default'=>null])
            ->addColumn('meta_description', 'string',['limit'=>'255','null'=>true,'default'=>null])
            ->save();
        $table->renameColumn('name','title');

        $this->execute('ALTER TABLE `page` MODIFY `type` VARCHAR(255) NOT NULL;');

        $table = $this->table('block');
        $table->renameColumn('language','language_id');
    }
}