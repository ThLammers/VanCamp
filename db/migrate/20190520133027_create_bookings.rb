class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :van, foreign_key: true
      t.references :user, foreign_key: true
      t.date :checkin
      t.date :checkout

      t.timestamps
    end
  end
end
