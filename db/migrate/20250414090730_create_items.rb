class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|

      t.string :item_name,              null: false
      t.text :item_info,                null: false
      t.integer :item_category_id,      null: false
      t.integer :item_sales_status_id,  null: false
      t.integer :item_shipping_fee_status_id,   null: false
      t.integer :prefecture_id,                 null: false
      t.integer :item_scheduled_delivery_id,    null: false
      t.integer :item_price,            null: false
      t.timestamps

      t.references :user, null: false, foreign_key: true
    end
  end
end
