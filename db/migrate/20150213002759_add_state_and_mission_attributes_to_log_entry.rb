class AddStateAndMissionAttributesToLogEntry < ActiveRecord::Migration
  def change
    add_column :log_entries, :sound_on, :boolean
    add_column :log_entries, :lights_on, :boolean
    add_column :log_entries, :light_directive, :string
  end
end
