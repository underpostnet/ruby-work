class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :full_name
      t.string :phone
      t.string :city
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
