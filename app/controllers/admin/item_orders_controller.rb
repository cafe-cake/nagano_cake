class Admin::ItemOrdersController < ApplicationController
  before_action :authenticate_admin!

  def update
    @item_orders = OrderDetail.find(params[:id])
    @item_orders.update(item_orders_params)
    redirect_to admin_order_path(@item_order.order)
  end

  private

  def item_order_params
    params.require(:item_order).permit(:making_status)
  end

end