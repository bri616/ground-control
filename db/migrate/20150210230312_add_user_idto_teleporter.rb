class AddUserIdtoTeleporter < ActiveRecord::Migration
  def change
    add_column :teleporters, :user_id, :integer
  end
end
