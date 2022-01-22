class Public::AddressesController < ApplicationController
before_action :authenticate_member!
  def index
    @addresses = current_member.addresses
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.member_id = current_member.id
    @address.save
    if redirect_to addresses_path
    else
      @addresses = Address.all
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update!(address_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to action: :index
  end

  private

    def address_params
      params.require(:address).permit(:post_number,:address,:name,:member_id)
    end
end
