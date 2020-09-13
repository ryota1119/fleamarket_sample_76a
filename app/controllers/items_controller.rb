class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update]

  def index
  end

  def new
    @item = Item.new
    @item.images.new
    @category_parent_array = Category.where(ancestry: nil).pluck(:name).unshift("---")
  end

  def create
    @item = Item.new(item_params)
    @category_parent_array = Category.where(ancestry: nil).pluck(:name).unshift("---")
    if @item.save
      redirect_to root_path
    else
      @item.images.new
      render :new
    end
  end

  def edit
    grandchild_category = @item.category
    child_category = grandchild_category.parent
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    @category_children_array = Category.where(ancestry: child_category.ancestry)
    @category_grandchildren_array = Category.where(ancestry: grandchild_category.ancestry)
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  

  private
  
  def item_params
    params.require(:item).permit(:name, :description, :brand, :condition, :status, :shipping_costs, :shipping_from, :shipping_date, :price, :category_id, images_attributes: [:src])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
