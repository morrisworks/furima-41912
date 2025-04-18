class RemoveItemImageFromItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :items, :item_image, :string
  end
end
