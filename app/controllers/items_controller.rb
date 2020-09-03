class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  private
  def item_params
    params.requite(:item).permit(:name)
  end
  
end
