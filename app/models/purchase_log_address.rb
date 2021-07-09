class PurchaseLogAddress
  include ActiveModel::Model
  attr_accessor :receiver_postal_code, :user_area_id, :receiver_cities, :receiver_address, :receiver_building_name, :receiver_phone_number, :item_id, :user_id, :price, :token


  with_options presence: true do
    validates :user_id, :item_id
    validates :receiver_postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :receiver_cities, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :receiver_address
    validates :receiver_phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :token
  end
  validates :user_area_id, numericality: {other_than: 0, message: "can't be blank"}


  def save
    purchase_log = PurchaseLog.create(item_id: item_id, user_id: user_id)

    Address.create(receiver_postal_code: receiver_postal_code, user_area_id: user_area_id, receiver_cities: receiver_cities, receiver_address: receiver_address, receiver_building_name: receiver_building_name, receiver_phone_number: receiver_phone_number, purchase_log: purchase_log)
  end
end