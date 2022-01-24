class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @item = Item.where(sales_status: 0).all
    @items = Item.where(sales_status: 0).page(params[:page]).per(6)
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new

    unless member_signed_in?
    flash[:alert] =
    "ログイン済みユーザーのみカートに商品を追加できます"
    end
  end
end
