class StateSetting < ActiveRecord::Base
  belongs_to :teleporter

  def toggle_lights
    update(lights_on: !lights_on)
  end

  def toggle_sound
    update(sound_on: !sound_on)
  end
end
