class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, nill: :false
      t.integer :shipping_prefecture_id, nill: :false
      t.string :city, nill: :false
      t.string :address, nill: :false
      t.string :building, default: ""
      t.string :phone_number, nill: :false
      t.references :purchase_history, nill: :false
      t.timestamps
    end
  end
end
