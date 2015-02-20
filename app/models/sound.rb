class Sound < ActiveRecord::Base
  has_and_belongs_to_many :mission_settings
end
