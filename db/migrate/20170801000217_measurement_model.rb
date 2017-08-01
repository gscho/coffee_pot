class MeasurementModel < ActiveRecord::Migration[5.1]
  def up
    create_table :measurements do |t|
      t.string :key, :limit => 45
      t.string :value, :limit => 45
      t.belongs_to :device, index: true
      t.timestamps
    end

  end
  def down
    drop_table :measurements
  end
end
