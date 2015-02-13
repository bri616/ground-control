class LogEntriesController < ApplicationController
  def show
    @city = request.location.city
    @country = request.location.country_code
  end
end
