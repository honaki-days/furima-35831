FactoryBot.define do
  factory :purchase_log_address do
    receiver_postal_code   { '123-4567' }
    user_area_id           { 2 }
    receiver_cities        { '東京都' }
    receiver_address       { '新宿区' }
    receiver_building_name { '新宿' }
    receiver_phone_number  { '08066667777' }
    token                  {"tok_abcdefghijk00000000000000000"}
  end
end
