class AddSoundPatternSoundJoinTable < ActiveRecord::Migration
  def change
    create_table "sound_patterns_sounds", :id => false, :force => true do |t|
      t.integer "sound_pattern_id"
      t.integer "sound_id"
    end
  end
end
