FactoryBot.define do
  factory :item do
    name                   {Faker::Name.initials(number: 2)}
    explanation            {Faker::Lorem.sentence}
    show_category_id       {1}
    show_state_id          {2}
    shipping_fee_bearer_id {1}
    shipping_prefecture_id {2}
    shipping_day_id        {1}
    price                  {5000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
