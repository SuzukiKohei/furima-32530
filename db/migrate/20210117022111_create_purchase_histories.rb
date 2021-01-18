class CreatePurchaseHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_histories do |t|
      t.references :item, nill: :false
      t.references :user, nill: :false
      t.timestamps
    end
  end
end
