class Light < ActiveRecord::Base
  def toggle_active
    update(is_active: !is_active)
  end
end
