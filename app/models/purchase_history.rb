class PurchaseHistory < ApplicationRecord
  belongs_to :item
  has_one :Address
end
