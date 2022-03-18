class CreateReservation < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.belongs_to :guest, :index => true
      t.string :code
      t.datetime :start_date
      t.datetime :end_date
      t.integer :nights
      t.integer :guests
      t.integer :adults
      t.integer :children
      t.integer :infants
      t.string :status
      t.string :description
      t.string :currency
      t.decimal :payout_price
      t.decimal :security_price
      t.decimal :total_price

      t.timestamps
    end
  end
end
