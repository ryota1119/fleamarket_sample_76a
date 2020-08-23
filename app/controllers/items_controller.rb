class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Tweet.create(item_params)
  end

  private
  def item_params
    params.requite(:item).permit(:name)
  end
  
end
