class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :number
      t.integer :amount
      t.datetime :completed_at
      t.string :address_1
      t.string :address_2
      t.string :state
      t.references :user, foreign_key: true
      t.text :note
      t.datetime :paied_at
      t.integer :payment_amount

      t.timestamps
    end
  end
end
