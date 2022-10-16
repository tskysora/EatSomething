class MembershipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new], raise: false

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def new
    if user_signed_in?
      create
    else
      redirect_to new_user_session_path(invite_token: params[:invite_invite_token])
    end
  end

  def create
    invite = Invite.find_by_invite_token!(params[:invite_invite_token])
    group = Group.find_by!(id: invite.group_id)
    Membership.where(group: group, user: current_user).first_or_create
    flash[:notice] = '已成功加入這個團體！'
    redirect_to group_path(group)
  end

  private
  def record_not_found
    render file: "#{Rails.root}/public/invalid.html",
           status: :not_found,
           layout: false
  end
end
