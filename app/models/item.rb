class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  with_options presence: true do
    validates :name
    validates :description, length: { maximum: 1000 }
    validates :condition
    validates :status
    validates :shipping_costs
    validates :shipping_from
    validates :shipping_date
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
  validates_associated :images
  validates :images, presence: true
end
