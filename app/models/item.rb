class Item < ApplicationRecord
  has_one_attached :image
  has_one :purchase_log
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :detail_category 
  belongs_to :detail_condition
  belongs_to :user_area 
  belongs_to :delivery_charge
  belongs_to :delivery_time

  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end

  with_options presence: true do
    validates :price, inclusion: { in: 300..9999999 }, format: {with: /\A[0-9]+\z/}
    # validates :detail_category_id, :detail_condition_id, :user_area_id, :delivery_charge_id, :delivery_time_id, numericality: { other_then: 1 }
  end

  with_options numericality: {other_than: 1} do
    validates :detail_category_id
    validates :detail_condition_id
    validates :user_area_id
    validates :delivery_charge_id
    validates :delivery_time_id
  end
end