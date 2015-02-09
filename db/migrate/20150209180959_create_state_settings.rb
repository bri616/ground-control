class CreateStateSettings < ActiveRecord::Migration
  def change
    create_table :state_settings do |t|
      t.boolean :lights_on
      t.integer :teleporter_id

      t.timestamps
    end
  end
end
