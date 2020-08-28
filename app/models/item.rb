class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :condition
    validates :status
    validates :shipping_costs
    validates :shipping_from
    validates :shipping_date
    validates :price
  end
end
