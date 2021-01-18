FactoryBot.define do
  factory :purchase_history_address do
    token                   { 'tok_a460d891e37b3f3e308d40dd12b5' }
    postal_code             { '123-4567' }
    shipping_prefecture_id  { 23 }
    city                    { '秋山市' }
    address                 { '青山1-1-1' }
    phone_number            { '09012345678' }
  end
end
