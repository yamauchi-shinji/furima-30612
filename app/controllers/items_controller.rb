class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: [:edit]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = item_find_params
  end

  def edit
    @item = item_find_params
  end

  def update
    @item = item_find_params
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:product, :description, :category_id, :status_id, :shipping_charge_id, :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end
  def move_to_index
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id && !@item.purchase.present? 
      redirect_to action: :index
    end
  end
  def item_find_params
    Item.find(params[:id])
  end
end
