class StateSetting < ActiveRecord::Base
  belongs_to :teleporter

  def toggle_lights
    update(lights_on: !lights_on)
  end
end
