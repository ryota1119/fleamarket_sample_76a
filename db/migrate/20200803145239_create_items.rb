class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.timestamps
      t.string :name,             null: false
      t.text :description,        null: false
      t.string :brand,            null: false
      t.integer :condition,       default: 0, null: false
      t.integer :status,          default: 0, null: false
      t.integer :shipping_costs,  default: 0, null: false
      t.integer :shipping_from,   default: 0, null: false
      t.integer :shipping_date,   default: 0, null: false
      t.integer :price,           default: 0, null: false
    end
  end
end
