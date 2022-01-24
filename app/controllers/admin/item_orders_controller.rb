class Admin::ItemOrdersController < ApplicationController
  before_action :authenticate_admin!

  def update
    @item_orders = ItemOrder.find(params[:id])
    @item_orders.update(item_orders_params)
    redirect_to request.referer
  end

  private

  def item_orders_params
    params.require(:item_order).permit(:making_status)
  end

end