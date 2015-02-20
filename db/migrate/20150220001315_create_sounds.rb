class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.string :file_name

      t.timestamps
    end
  end
end
