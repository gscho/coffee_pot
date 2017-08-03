class MeasurementModel < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :measurements, :devices
  end
  def up
    create_table :measurements do |t|
      t.string :key, :limit => 45
      t.string :value, :limit => 45
    end
  end
  def down
    drop_table :measurements
  end
end
