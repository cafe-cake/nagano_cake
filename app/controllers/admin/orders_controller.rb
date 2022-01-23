class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.all.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @item_orders = @order.item_orders
    @total_payment = 0
    @item_orders.each do |item_orders|
      @total_payment += ((item_orders.item.price*item_orders.count)*1.1).floor
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
