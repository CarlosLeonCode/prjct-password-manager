class CreatePasswords < ActiveRecord::Migration[7.1]
  def change
    create_table :passwords do |t|
      t.text :url
      t.string :username
      t.text :password

      t.timestamps
    end
  end
end
