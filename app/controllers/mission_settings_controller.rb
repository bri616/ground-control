class MissionSettingsController < ApplicationController
  before_filter :current_mission_setting, :light_directive_list, :sound_directive_list
  skip_before_filter :logged_in, :current_teleporter, :current_mission_setting, :light_directive_list, only: [:mission_settings, :current_sound_pattern]

  def update
    mission_params = params.permit(:light_directive, :sound_pattern_id)
    if mission_params[:light_directive] == "random"
        mission_params[:light_directive] = LightDirective.all.map(&:name).sample
    end
    @mission_setting.update(mission_params)
    render :show
  end

  def mission_settings
    teleporter = Teleporter.find_by(uid: params[:uid])
    render json: { mission_settings: teleporter.mission_setting }
  end

  def current_sound_pattern
    teleporter = Teleporter.find_by(uid: params[:uid])
    render json: { sound_pattern: teleporter.sound_pattern_array }
  end

  private

  def current_mission_setting
    @mission_setting = @current_teleporter.mission_setting
  end

  def light_directive_list
    @light_directive_list = ["oz", "tatooine", "batcave", "seattle", "caprica", "camazotz"]
  end

  def sound_directive_list
    @sound_directive_list = SoundPattern.all.collect(&:name)
  end
end
