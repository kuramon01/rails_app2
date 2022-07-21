class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :introduction
      t.integer :price
      t.string :address
      t.string :img_name
      t.integer :user_id

      t.timestamps
    end
  end
end
