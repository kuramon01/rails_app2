class ChangeDatatypeStartDayOfReservations < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :start_day, :date
    change_column :reservations, :end_day, :date
  end
end
