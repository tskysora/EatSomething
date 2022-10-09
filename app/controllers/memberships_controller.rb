class MembershipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new], raise: false

  def new
    if user_signed_in?
      create
    else
      redirect_to new_user_registration_path(invite_token: params[:group_invite_token])
    end
  end

  def create
    group = Group.find_by_invite_token(params[:group_invite_token])
    Membership.where(group: group, user: current_user).first_or_create
    flash[:notice] = '已成功加入這個團體！'
    redirect_to group_path(group)
  end
end
