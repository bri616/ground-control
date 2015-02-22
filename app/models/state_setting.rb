class StateSetting < ActiveRecord::Base
  belongs_to :teleporter

  def toggle_lights
    update(lights_on: !lights_on)
  end

  def toggle_sound
    update(sound_on: !sound_on)
  end

  def toggle_power_off
    update(power_off: !power_off)
  end

end
