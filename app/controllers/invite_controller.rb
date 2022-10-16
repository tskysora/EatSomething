class InviteController < ApplicationController
  before_action :find_invite, only: [:show]

  def new
    @invite = Invite.new
  end

  def show
    find_invite
  end

  private
  def find_invite
    @invite = Invite.find_by_invite_token(params[:invite_token])
  end
end
