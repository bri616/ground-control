class MissionSetting < ActiveRecord::Base
  belongs_to :teleporter
  has_many :sounds
end
