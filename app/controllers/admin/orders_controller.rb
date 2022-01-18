class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all.page(params[:page])
  end
end
