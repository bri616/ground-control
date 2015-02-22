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
    @power_off = current_teleporter.state_setting.power_off
  end

  def toggle_lights
    current_teleporter.state_setting.toggle_lights
    @lights_on = current_teleporter.state_setting.lights_on
    render json: { lights_on: @lights_on }
  end

  def toggle_sound
    current_teleporter.state_setting.toggle_sound
    @sound_on = current_teleporter.state_setting.sound_on
    render json: { sound_on: @sound_on }
  end

  def toggle_power_off
    current_teleporter.state_setting.toggle_power_off
    @power_off = current_teleporter.state_setting.power_off
    render json: { power_off: @power_off }
  end


  def state_settings
    teleporter = Teleporter.find_by(uid: params[:uid])
    if teleporter.log_entries.length == 0 || teleporter.log_entries.last.created_at < 5.seconds.ago
      teleporter.log_entries.create(lights_on: teleporter.state_setting.lights_on, sound_on: teleporter.state_setting.sound_on, light_directive: teleporter.mission_setting.light_directive)
    end
    render json: {state_settings: teleporter.state_setting}
  end

end
