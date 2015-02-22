class AddPowerOffToStateSettings < ActiveRecord::Migration
  def change
    add_column :state_settings, :power_off, :boolean, :default => false
  end
end
