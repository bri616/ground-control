class PagesController < ApplicationController
  skip_before_filter :logged_in, :current_teleporter, only: [:about]

  def about
    @light_directives = LightDirective.all
  end
end
