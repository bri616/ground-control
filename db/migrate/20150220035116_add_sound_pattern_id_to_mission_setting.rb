class AddSoundPatternIdToMissionSetting < ActiveRecord::Migration
  def change
    def change
      add_column :mission_settings, :sound_pattern_id, :integer
    end
  end
end
