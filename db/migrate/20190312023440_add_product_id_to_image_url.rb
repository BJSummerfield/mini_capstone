class AddProductIdToImageUrl < ActiveRecord::Migration[5.2]
  def change
    add_column :image_urls, :product_id, :integer
  end
end
