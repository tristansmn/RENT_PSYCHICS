class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :status, default: "pending"
      t.datetime :start_date
      t.datetime :end_date
      t.integer :nb_accessories
      t.float :total_price
      t.references :user, null: false, foreign_key: true
      t.references :psychic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
