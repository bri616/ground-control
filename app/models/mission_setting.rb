class MissionSetting < ActiveRecord::Base
  belongs_to :teleporter
  has_one :sound_pattern
end
