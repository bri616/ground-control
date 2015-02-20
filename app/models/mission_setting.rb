class MissionSetting < ActiveRecord::Base
  belongs_to :teleporter
  has_and_belongs_to_many :sounds
end
