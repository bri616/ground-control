class StateSettingsController < ApplicationController

  def show
    @lights_on = current_teleporter.state_setting.lights_on
  end

  def toggle_lights
    current_teleporter.state_setting.toggle_lights
    @lights_on = current_teleporter.state_setting.lights_on
    render :show
  end

  private

  def current_teleporter
    Teleporter.find_by(uid:"826dev")
  end

end
