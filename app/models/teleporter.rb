class Teleporter < ActiveRecord::Base
  has_one :state_setting
  has_one :mission_setting
end
