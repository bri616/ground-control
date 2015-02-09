class StateSettingsController < ApplicationController

  def show
    @lights_on = current_teleporter.state_setting.lights_on
  end

  def toggle_lights
    current_teleporter.state_setting.toggle_lights
    @lights_on = current_teleporter.state_setting.lights_on
    render :show
  end

  def state_settings
    teleporter = Teleporter.find_by(uid: params[:uid])
    render json: {state_settings: teleporter.state_setting}
  end

  private

  def current_teleporter
    Teleporter.find_by(uid:"826dev")
  end

end
