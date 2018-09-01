class ChangePriceDatatypeToInteger2 < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :price, :integer
  end
end
