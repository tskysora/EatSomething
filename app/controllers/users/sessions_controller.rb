# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    if params[:invite_token]
      @invite = Invite.find_by_invite_token(params[:invite_token])
      @group = Group.find_by(id:@invite.group_id)
    end
    super
  end

  # POST /resource/sign_in
  def create
    if params[:user][:invite_token]
      @invite = Invite.find_by_invite_token(params[:user][:invite_token])
      @group = Group.find_by(id:@invite.group_id)
      if !current_user.member?(@group)
        Membership.where(group: @group, user: current_user).first_or_create
        super
        flash[:notice] = "已成功加入#{@group.name}！"  
      else
        super
        flash[:notice] = "你已經是#{@group.name}的會員了！"
      end
    else
      super
    end
  end

  

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
