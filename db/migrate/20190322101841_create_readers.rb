class CreateReaders < ActiveRecord::Migration[5.2]
  def change
    create_table :readers do |t|
      t.references :thermostat, index: true
      t.integer :number
      t.float :temperature
      t.float :humidity
      t.float :battery_charge

      t.timestamps
    end
  end
end
