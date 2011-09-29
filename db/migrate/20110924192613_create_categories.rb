class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :title

      t.timestamps
    end 
         
    execute <<-SQL 
        insert into categories(title) values('Sale');

        SQL


         execute <<-SQL 
            insert into categories(title) values('Rent');

            SQL
  end

  def self.down
    drop_table :categories
  end
end
