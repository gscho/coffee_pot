class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      t.string :name, :limit => 45
      t.string :email, :limit => 45
      t.string :password, :limit => 45
    end
  end
  def down
  	drop_table :users
  end
end
