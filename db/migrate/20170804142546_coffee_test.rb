class CoffeeTest < ActiveRecord::Migration[5.1]
  def up
    create_table :coffee_test do |t|
      t.timestamps
      t.string :weekday, :limit => 45
	    t.float :volatage, :limit => 20
	    t.float :weight, :limit => 20
    end
  end
  def down
    drop_table :coffee_test
  end
  def change
  end
end
