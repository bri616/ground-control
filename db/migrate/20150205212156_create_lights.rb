class CreateLights < ActiveRecord::Migration
  def change
    create_table :lights do |t|
      t.boolean :is_active
      t.string :pattern_name

      t.timestamps
    end
  end
end
