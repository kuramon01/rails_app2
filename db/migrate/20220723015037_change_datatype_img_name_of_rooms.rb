class ChangeDatatypeImgNameOfRooms < ActiveRecord::Migration[7.0]
  def change
    change_column :rooms, :img_name, :text
  end
end
