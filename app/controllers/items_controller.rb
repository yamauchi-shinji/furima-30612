class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :item_find_params, only: [:show, :edit, :update, :destroy]
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:product, :description, :category_id, :status_id, :shipping_charge_id, :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    item_find_params
    unless current_user.id == @item.user_id && !@item.purchase.present? 
      redirect_to action: :index
    end
  end
  
  def item_find_params
    @item = Item.find(params[:id])
  end
end
