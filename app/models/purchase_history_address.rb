class PurchaseHistoryAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :shipping_prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number
    validates :token
  end

  def save
    purchase_history = PurchaseHistory.create(user_id: current_user.id, item_id: @item.id)
    Address.create(postal_code: postal_code, shipping_prefecture_id: shipping_prefecture_id, city: city,address: address, building: building, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end
end