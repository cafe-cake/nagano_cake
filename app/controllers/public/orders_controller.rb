class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @item_order = ItemOrder.find(params[:id])
    @items = Item.all
    @item_orders = ItemOrder.all
  end

end
