class RemoveStateSettingIdFromTeleporter < ActiveRecord::Migration
  def change
    remove_column :teleporters, :state_setting_id
  end
end
