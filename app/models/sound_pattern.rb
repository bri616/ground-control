class SoundPattern < ActiveRecord::Base
  has_and_belongs_to_many :sounds
  # TODO: fix this relationship issue
  has_one :mission_setting
end
