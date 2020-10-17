class ChangeColumnToItem < ActiveRecord::Migration[5.2]
  def change
    change_column_default :items, :condition, from: 1, to: false
    change_column_default :items, :shipping_costs, from: 1, to: false
    change_column_default :items, :shipping_from, from: 1, to: false
    change_column_default :items, :shipping_date, from: 1, to: false
  end
end
