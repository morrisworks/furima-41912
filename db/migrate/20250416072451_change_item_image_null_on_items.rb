class ChangeItemImageNullOnItems < ActiveRecord::Migration[7.1]
  def change
    change_column_null :items, :item_image, false
  end
end
