class Public::MembersController < ApplicationController
  before_action :authenticate_member!
  
  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to member_path(@member.id)
    else
      render "edit"
    end
  end

  def unsubscribe
  end

  def withdraw
    @member = current_member
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = "またのご利用をお待ちしております。"
    redirect_to root_path
  end

  private

  def member_params
  params.require(:member).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:post_number,:address,:phone_number,:email,:is_deleted)
  end

end