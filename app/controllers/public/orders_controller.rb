class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
    @orders = Order.all
    @order = current_member
  end

  def show
    @order = Order.find(params[:id])
    @order = current_member
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

    current_member.cart_items.each do |cart_item|
      @item_orders = ItemOrder.new
      @item_orders.item_id = cart_item.item_id
      @item_orders.price = cart_item.item.price
      @item_orders.count = cart_item.count
      @item_orders.order.id = @order.id
      @item_orders.save
    end

    current_member.cart_items.destroy_all
    redirect_to order_fix_orders_path
  end

  def order_fix
  end

  private

  def order_params
    params.require(:order).permit(:payment_methods, :post_number, :address, :name, :total_payment)
  end

end
