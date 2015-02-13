class StateSettingsController < ApplicationController
  skip_before_filter :logged_in, :current_teleporter, only: [:landing, :state_settings]

  def landing
    if current_user
      redirect_to root_path
    else
      render :layout => false
    end
  end

  def show
    @lights_on = current_teleporter.state_setting.lights_on
    @sound_on = current_teleporter.state_setting.sound_on
  end

  def toggle_lights
    current_teleporter.state_setting.toggle_lights
    @lights_on = current_teleporter.state_setting.lights_on
    render json: { lights_on: @lights_on }
  end

  def toggle_sound
    current_teleporter.state_setting.toggle_sound
    @sound_on = current_teleporter.state_setting.sound_on
    render json: { lights_on: @sound_on }
  end

  def state_settings
    teleporter = Teleporter.find_by(uid: params[:uid])
    teleporter.create_log_entry(lights_on: teleporter.state_setting.lights_on, sound_on: teleporter.state_setting.sound_on, light_directive: teleporter.mission_setting.light_directive)
    render json: {state_settings: teleporter.state_setting}
  end

end
