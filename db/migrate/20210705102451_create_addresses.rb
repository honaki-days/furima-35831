class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :receiver_postal_code,    null: false
      t.integer :user_area_id,            null: false
      t.string  :receiver_cities,         null: false
      t.string  :receiver_address,        null: false
      t.string  :receiver_building_name,  null: false
      t.string  :receiver_phone_number,   null: false
      t.references :purchase_log, null:false, foreign_key: true
      t.timestamps
    end
  end
end
