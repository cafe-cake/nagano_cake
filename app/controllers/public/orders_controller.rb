class Public::OrdersController < ApplicationController

  def new
    if CartItem.exists?(member_id: current_member.id)
      @order = Order.new
    else
      redirect_to items_path
    end
    @addresses = current_member.addresses.all
  end

  def index
    @orders = Order.order(updated_at: :desc).page(params[:page]).per(10)
    @order = current_member
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

  def confirm
    @cart_items = CartItem.all
    @member = current_member
    @total_payment = 0
    @cart_items.each do |cart_item|
      @total_payment += ((cart_item.item.price*cart_item.count)*1.1).floor
    end
    @order = Order.new(order_params)
    @postage = 800
    @order.total_payment = @total_payment + 800
    if params[:order][:select_address] == "0"
    @order.post_number = current_member.post_number
    @order.address = current_member.address
    @order.name = current_member.last_name + current_member.first_name
    elsif params[:order][:select_address] == "1"
    @address = Address.find(params[:order][:member_id])
    @order.post_number = @address.post_number
    @order.address = @address.address
    @order.name = @address.name
    else params[:order][:select_address] = "2"
    @order.post_number = params[:order][:post_number]
    @order.address = params[:order][:address]
    @order.name = params[:order][:name]
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
      @item_orders.order_id = @order.id
      @item_orders.save
    end

    current_member.cart_items.destroy_all
    redirect_to order_fix_orders_path
  end

  def order_fix
  end

  private

  def order_params
    params.require(:order).permit(:payment_methods, :post_number, :address, :name, :total_payment,:postage)
  end

end
