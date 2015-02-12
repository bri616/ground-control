class MissionSettingsController < ApplicationController
  before_filter :mission_setting, :light_directive_list

  def update
    mission_params = params.require(:mission_setting).permit(:light_directive)
    @mission_setting.update(mission_params)
    render :show
  end

  private

  def mission_setting
    @mission_setting = @current_teleporter.mission_setting
  end

  def light_directive_list
    @light_directive_list = ["oz", "mars", "batcave"]
  end
end
