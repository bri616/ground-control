class CreateLightDirectives < ActiveRecord::Migration
  def change
    create_table :light_directives do |t|
      t.string :name
      t.text :icon_url
      t.string :icon_creator_name

      t.timestamps
    end
  end
end
