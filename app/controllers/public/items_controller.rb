class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @items = Item.where(sales_status: 0).page(params[:page]).per(8)
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
