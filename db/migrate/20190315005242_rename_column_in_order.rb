class RenameColumnInOrder < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :product, :product_id
  end
end
