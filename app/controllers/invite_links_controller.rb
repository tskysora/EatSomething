class InviteLinksController < ApplicationController
  def show
    @group = Group.friendly.find(params[:group_id])
    if @group.editable?(current_user)
      @invite = @group.token
      @invite.regenerate_invite_token
      @invite_link = new_invite_membership_url(@group.token)
      respond_to do |format|
        format.html
        format.json {render json: { link: @invite_link, invite_token: @group.token.invite_token } }
      end
    end
  end
end
