class MembershipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new], raise: false
  before_action :find_group, only: [:new, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def new
    if user_signed_in?
      if !current_user.member?(@group)
        create  
      else
        flash[:notice] = '你已經是本團體會員了！'
        redirect_to group_path(@group)
      end
    else
      redirect_to new_user_session_path(invite_token: params[:invite_invite_token])
    end
  end

  def create
    Membership.where(group: @group, user: current_user).first_or_create
    flash[:notice] = '已成功加入這個團體！'
    redirect_to group_path(@group)
  end

  private
  def record_not_found
    render file: "#{Rails.root}/public/invalid.html",
           status: :not_found,
           layout: false
  end

  def find_group
    @invite = Invite.find_by_invite_token!(params[:invite_invite_token])
    @group = Group.find_by(id: @invite.group_id)
  end
end
