class DeviceModel < ActiveRecord::Migration[5.1]
  def up
    create_table :devices do |t|
      t.string :name, :limit => 45
      t.timestamps
    end
  end
  def down
    drop_table :devices
  end
end
