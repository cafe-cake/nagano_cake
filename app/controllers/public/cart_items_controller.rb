class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_member.cart_items
    @total = @cart_items.sum{|cart_item|cart_item.item.price * cart_item.count * 1.1}
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.member_id = current_member.id
    if @cart_item.save
      redirect_to cart_items_path
    else
      flash[:alert] = "個数を選択してください"
      redirect_to item_path(@cart_item.item_id)
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_item = current_member.cart_items
    @cart_item.destroy_all
    redirect_to cart_items_path flash[:alert] = "カート内の商品をすべて削除しました"
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :member_id, :count)
  end
end
