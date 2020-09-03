class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @category_parent_array = ["---"]
    @category_parent_array = Category.where(ancestry: nil)
  end

  def get_category_children
  @category_children = Category.find(params[:parent_id]).category_children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:children_id]).children_id
  end
end
  end

  private
  def item_params
    params.requite(:item).permit(:name)
  end
  
end
