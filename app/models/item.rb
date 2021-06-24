class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :detail_category 
  belongs_to :detail_condition
  belongs_to :user_area 
  belongs_to :delivery_charge
  belongs_to :delivery_time

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true

  with_options presence: true do
    validates :price, inclusion: { in: 300..9999999 }, format: {with: /\A[0-9]+\z/}
  end

  validates :detail_category_id, :detail_condition_id, :user_area_id, :delivery_charge_id, :delivery_time_id, numericality: { other_then: 1 }
end