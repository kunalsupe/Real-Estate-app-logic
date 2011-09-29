class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :name
      t.string :code

      t.timestamps
    end     
     Country.create(:name => 'India' ,:code => '99') 
  end

  def self.down
    drop_table :countries
  end
end
