class AddSoundOnToStateSettings < ActiveRecord::Migration
  def change
    add_column :state_settings, :sound_on, :boolean, :default => false
  end
end
