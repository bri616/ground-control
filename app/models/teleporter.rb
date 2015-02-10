class Teleporter < ActiveRecord::Base
  belongs_to :user
  has_one :state_setting
  has_one :mission_setting
end
