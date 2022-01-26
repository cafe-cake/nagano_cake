class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.all(update_at: :desc).page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @item_orders = @order.item_orders
    @postage = 800
    @total_payment = 0
    @item_orders.each do |item_orders|
      @total_payment += ((item_orders.item.price*item_orders.count)*1.1).floor
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.order_status == "payment_confirmation"
      @order.item_orders.each do |item_order|
      item_order.making_status = "wait"
      item_order.save
      end
    end
    redirect_to request.referer
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
