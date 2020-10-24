class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :show_all_instance, only: [:show, :edit, :update, :destroy]
  before_action :category_parent_array, only: [:new, :create, :edit, :update]

  def index
    @items = Item.where(status: 1).limit(5).order("created_at DESC")
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
    grandchild_category = @item.category
    child_category = grandchild_category.parent
    @category_children_array = Category.where(ancestry: child_category.ancestry)
    @category_grandchildren_array = Category.where(ancestry: grandchild_category.ancestry)
  end

  def update
    @parents = Category.where(ancestry: nil)
    grandchild_category = @item.category
    child_category = grandchild_category.parent
    @category_children_array = Category.where(ancestry: child_category.ancestry)
    @category_grandchildren_array = Category.where(ancestry: grandchild_category.ancestry)
    if params[:item].keys.include?("image") || params[:item].keys.include?("images_attributes") 
      if @item.valid?
        if params[:item].keys.include?("images_attributes")
          update_images_ids = params[:item][:images_attributes].values
          before_images_ids = @item.images.ids
          before_images_ids.each do |before_img_id|
            Image.find(before_img_id).destroy unless update_images_ids.include?("id"=>"#{before_img_id}")
          end
        else
          before_images_ids = @item.images.ids
          before_images_ids.each do |before_img_id|
            Image.find(before_img_id).destroy
          end
        end
        if @item.update(item_params)
          redirect_to item_path(@item), notice: "商品を更新しました"
        else
          render 'edit'
        end
      else
        render 'edit'
      end
    else
      redirect_back(fallback_location: root_path,flash: {success: '画像がありません'})
    end
  end

  def show
    @image = @item.images
    @grand_child_category = @item.category
    @child_category = @grand_child_category.parent
    @parent_category = @child_category.parent
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  

  def search
    @items = Item.search(params[:keyword]).limit(40).order("created_at DESC")
    @keyword = params[:keyword]
  end

  def set_item
    @item = Item.find(params[:id])
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
