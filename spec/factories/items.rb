FactoryBot.define do
  factory :item do
    name                  {Faker::Name.initials(number: 2)}
    description           {Faker::Lorem.sentence}
    detail_category       { DetailCategory.all.sample }
    detail_condition      { DetailCondition.all.sample }
    delivery_charge       { DeliveryCharge.all.sample }
    user_area             { UserArea.all.sample }
    delivery_time         { DeliveryTime.all.sample }
    price                 {3000}
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end