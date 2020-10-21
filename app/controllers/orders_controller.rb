class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_order = PurchaseOrder.new(order_params)
    if @purchase_order.valid?
      pay_item
      @purchase_order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone, :item_id, :price).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency: 'JPY'
      )
  end

  def move_to_index
    if params[:id].present?
      @item = Item.find(params[:id])
    elsif params[:item_id]
      @item = Item.find(params[:item_id])
    else
      redirect_to root_path
    end
    if current_user.id == @item.user_id || @item.purchase.present? 
      redirect_to root_path
    end
  end
end
