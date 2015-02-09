class AddStateSettingIdtoTeleporter < ActiveRecord::Migration
  def change
    add_column :teleporters, :state_setting_id, :integer
  end
end
