class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
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
  validates_associated :images
  validates :images, presence: true
end
