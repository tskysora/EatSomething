class InviteLinksController < ApplicationController
  def show
    @group = Group.find(params[:group_invite_token])
  end
end
