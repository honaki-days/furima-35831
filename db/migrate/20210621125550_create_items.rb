class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,                null: false
      t.text    :description,         null: false
      t.text    :detail_category_id,  null: false
      t.integer :detail_condition_id, null: false
      t.integer :delivery_charge_id,  null: false
      t.integer :user_area_id,          null: false
      t.integer :delivery_time_id,    null: false
      t.integer :price,               null: false
      t.references :user, null:false, foreign_key: true
      t.timestamps
    end
  end
end
