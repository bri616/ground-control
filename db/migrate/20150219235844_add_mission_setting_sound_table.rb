class AddMissionSettingSoundTable < ActiveRecord::Migration
  def change
    create_table "mission_settings_sounds", :id => false, :force => true do |t|
    t.integer "mission_setting_id"
    t.integer "sound_id"
end
  end
end
