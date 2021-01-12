class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, nill: false
      t.text :explanation, nill: false
      t.integer :show_category_id, nill: false
      t.integer :show_state_id, nill: false
      t.integer :shipping_fee_bearer_id, nill: false
      t.integer :shipping_prefecture_id, nill: false
      t.integer :shipping_day_id, nill: false
      t.integer :price, nill: false
      t.references :user, nill: false, foreign_key: true
      t.timestamps
    end
  end
end
