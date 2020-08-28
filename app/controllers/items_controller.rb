class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @image = Image.new
  end

  def create
    Item.create(item_params)
    Image.create(image_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :brand, :condition, :status, :shipping_costs, :shipping_from, :shipping_date, :price)
  end

end
