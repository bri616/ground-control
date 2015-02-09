class CreateMissionSettings < ActiveRecord::Migration
  def change
    create_table :mission_settings do |t|
      t.string :light_directive
      t.string :sound_directive
      t.integer :teleporter_id

      t.timestamps
    end
  end
end
