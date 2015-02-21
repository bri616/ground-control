class MissionSettingsController < ApplicationController
  before_filter :current_mission_setting, :light_directive_list, :sound_directive_list
  skip_before_filter :logged_in, :current_teleporter, :current_mission_setting, :light_directive_list, only: [:mission_settings, :current_sound_pattern]

  def update
    light_params = params.permit(:light_directive)
    @mission_setting.update(light_params)
    # sound_params = params.require(:mission_setting).permit(:sound_pattern)
    # @mission_setting.sound_pattern = SoundPattern.find_by(sound_params)
    render :show
  end

  def mission_settings
    teleporter = Teleporter.find_by(uid: params[:uid])
    render json: {mission_settings: teleporter.mission_setting}
  end

  def current_sound_pattern
    teleporter = Teleporter.find_by(uid: params[:uid])
    render json: {sound_pattern: teleporter.mission_setting.sound_pattern.sounds.collect(&:file_name)}
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
