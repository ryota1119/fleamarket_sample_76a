class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update]
  before_action :show_all_instance, only: [:show, :edit, :destroy]
  before_action :category_parent_array, only: [:new, :create, :edit]

  def index
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.images.new
      render :new
    end
  end

  def edit
    @image = Item.find(params[:id])
    grandchild_category = @item.category
    child_category = grandchild_category.parent
    @category_children_array = Category.where(ancestry: child_category.ancestry)
    @category_grandchildren_array = Category.where(ancestry: grandchild_category.ancestry)
  end

  def update
    if item_params[:images_attributes].nil?
      flash.now[:alert] = '更新できませんでした 【画像を１枚以上入れてください】'
      render :edit
    else
      exit_ids = []
      item_params[:images_attributes].each do |a,b|
        exit_ids << item_params[:images_attributes].dig(:"#{a}",:id).to_i
      end
      ids = Image.where(item_id: params[:id]).map{|image| image.id }
      delete__db = ids - exit_ids
      binding.pry
      Image.where(id:delete__db).destroy_all
      @item.touch
      if @item.update(item_params)
        redirect_to  root_path
      else
        flash.now[:alert] = '更新できませんでした'
        render :edit
      end
    end
  end

  # def update_done
  #   @item_update = Item.order("updated_at DESC").first
  # end
  
  def show
    @item = Item.find(params[:id])
    @image = @item.images
    @grand_child_category = @item.category
    @child_category = @grand_child_category.parent
    @parent_category = @child_category.parent
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  

  private
  
  def item_params
    params.require(:item).permit(:name, :description, :brand, :condition, :status, :shipping_costs, :shipping_from, :shipping_date, :price, :category_id, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def show_all_instance
    @user = User.find(@item.user_id)
    @images = Image.where(item_id: params[:id])
    @images_first = Image.where(item_id: params[:id]).first
    @category_id = @item.category_id
    @category_parent = Category.find(@category_id).parent.parent                    
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
  end

  def category_parent_array
    @category_parent_array = Category.where(ancestry: nil).pluck(:name).unshift("---")
  end
end
