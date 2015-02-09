class CreateTeleporters < ActiveRecord::Migration
  def change
    create_table :teleporters do |t|
      t.string :name
      t.text :uid
      t.text :description

      t.timestamps
    end
  end
end
