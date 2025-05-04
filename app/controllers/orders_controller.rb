class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.create(order_params)
    Address.create(address_params)
    redirect_to root_path
  end

  private

  def order_params
    params.permit(:price).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(
      :postal_code, 
      :prefecture_id, 
      :city, 
      :house_number, 
      :building_name
    ).merge(order_id: @order.id)
  end
  
end
