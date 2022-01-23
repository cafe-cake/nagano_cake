class Public::OrdersController < ApplicationController
  before_action :authenticate_member!

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

  def confirm
    @cart_items = CartItem.all
    @member = current_member
    @total_payment = 0
    @cart_items.each do |cart_item|
      @total_payment += cart_item.item.price
    end
    @order = Order.new(order_params)
    @order.total_payment = @total_payment + 800
    if params[:order][:select_address] == "0"
    @order.post_number = current_member.post_number
    @order.address = current_member.address
    @order.name = current_member.last_name + current_member.first_name
    elsif params[:order][:select_address] == "1"
    @address = Address.find(params[:order][:select_address])
    @order.post_number = @address.post_number
    @order.address = @address.address
    @order.name = @address.name
    else params[:order][:select_address] == "2"
    end
  end

  def create
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    @order.save
    @cart_items = CartItem.all
    @cart_items.each do |cart_item|
      @item_orders = ItemOrder.new
      @item_orders.order_id = @order.id
      @item_orders.item_id = cart_item.item_id
      @item_orders.price = cart_item.item.price
      @item_orders.count = cart_item.count
    @item_orders.save
    end

  end

  private

  def order_params
     params.require(:order).permit(:payment_methods, :post_number, :address, :name, :total_payment,:order_status)
  end

end
