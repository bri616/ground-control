class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :rank
      t.string :password_digest
      t.string :recovery_email

      t.timestamps
    end
  end
end
