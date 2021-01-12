FactoryBot.define do
  factory :item do
    name
    explanation
    show_category_id
    show_state_id
    shipping_fee_bearer_id
    shipping_prefecture_id
  end
end
