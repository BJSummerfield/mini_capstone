class ChangeOrderProductIdToProduct < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :product_id, :product
  end
end
