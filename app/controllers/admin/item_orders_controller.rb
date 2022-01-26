class Admin::ItemOrdersController < ApplicationController
  before_action :authenticate_admin!

  def update
    @item_orders = ItemOrder.find(params[:id])
    @item_orders.update(item_orders_params)
    if @item_orders.making_status == "production"
      @item_orders.order.update(order_status:"in_production")
    end
    redirect_to request.referer
  end

  private

  def item_orders_params
    params.require(:item_order).permit(:making_status)
  end

end