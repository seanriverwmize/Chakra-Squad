class ChangePriceToInteger < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :price
    add_column :products, :price, :integer
  end
end
