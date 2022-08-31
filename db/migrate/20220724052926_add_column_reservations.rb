class AddColumnReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :img_name, :text
  end
end
