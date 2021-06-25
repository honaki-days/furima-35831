FactoryBot.define do
  factory :item do
    name                  {Faker::Name.initials(number: 2)}
    description           {Faker::Lorem.sentence}
    detail_category_id    { 2 }
    detail_condition_id   { 2 }
    delivery_charge_id    { 2 }
    user_area_id          { 2 }
    delivery_time_id      { 2 }
    price                 {3000}
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end