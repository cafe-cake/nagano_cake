class Public::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to member_path(@member)
  end
  
  def unsubscribe
    
  end
  
  def withdraw
  end
  
  private
  
  def member_params
  params.require(:member).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:post_number,:address,:phone_number,:email,:is_deleted)
  end 

end