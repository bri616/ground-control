class CreateSoundPatterns < ActiveRecord::Migration
  def change
    create_table :sound_patterns do |t|
      t.string :name

      t.timestamps
    end
  end
end
