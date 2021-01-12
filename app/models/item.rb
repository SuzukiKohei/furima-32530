class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :show_category_id
    validates :show_state_id
    validates :shipping_fee_bearer_id
    validates :shipping_prefecture_id
    validates :shipping_day_id
    validates :price
  end

  with_options inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ } do
    validates :price
  end

  with_options numericality: { other_than: 0, message: 'must be other than 0'} do
    validates :show_category_id
    validates :show_state_id
    validates :shipping_fee_bearer_id
    validates :shipping_prefecture_id
    validates :shipping_day_id
  end

  belongs_to :user
  has_one    :purchase_history
  has_one_attached :image

  belongs_to :show_category
  belongs_to :show_state
  belongs_to :shipping_day
  belongs_to :shipping_fee_bearer
  belongs_to :shipping_prefecture
end
