class MissionSetting < ActiveRecord::Base
  belongs_to :teleporter
  belongs_to :sound_pattern
end
