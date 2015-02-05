class LightsController < ApplicationController
  def toggle_active
    @light = Light.first
    @light.toggle_active
    render :show
  end

  def show
    @light = Light.first
  end

  def status
    @light = Light.first
    render json: {status: @light.is_active}
  end

end
