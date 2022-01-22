class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @members = Member.order(created_at: :asc).page(params[:page]).per(10)
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to admin_member_path(@member)
  end

  private

  def member_params
    params.require(:member).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:post_number,:address,:phone_number,:email,:is_deleted)
  end
end
