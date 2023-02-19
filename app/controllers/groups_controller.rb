class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_group_self, only: [:edit, :update, :destroy, :manager, :transfer]
  before_action :find_group, only: [:show, :quit]

  def index
    @groups = current_user.participated_groups.order(updated_at: :desc)
    # @groups = Group.order(updated_at: :desc)
  end

  def new
    @group = current_user.groups.new
  end

  def create
    @group = current_user.groups.new(group_params)
    
    if @group.save
      Invite.where(group: @group).create
      current_user.join!(@group)
      redirect_to groups_path, notice: "團體新增成功！"
    else
      render :new, status: :unprocessable_entity, content_type: "text/html"
      headers["Content-Type"] = "text/html"
    end
  end
  
  def edit
    
  end
  
  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: "團體更新成功！"
    else
      render :edit, status: :unprocessable_entity, content_type: "text/html"
      headers["Content-Type"] = "text/html"
    end
  end

  def destroy
   if @group.members.size < 2
    @group.destroy
    redirect_to groups_path, notice: "團體刪除成功！", status: :see_other
   else
    redirect_to groups_path, notice: "請移交管理權！"
   end
  end

  def show
    find_events
    find_events_unexpired
  end

  def join
    if !current_user.member?(@group)
      current_user.join!(@group)
      flash[:notice] = '已成功加入團體！'
    else
      flash[:notice] = '你已經是本團體會員了！'
    end
    redirect_to groups_path
  end

  def quit
    if current_user.member?(@group)
      current_user.quit!(@group)
      flash[:notice] = '你已離開此團體！'
    else
      flash[:notice] = '你不是本團體會員！'
    end
    redirect_to groups_path
  end

  def find_events_unexpired
    @events_unexpired = @events.select { |event| event.date > 1.day.ago }
  end

  def manager

  end

  def transfer
    if @group.update(group_manager_params)
      redirect_to groups_path, notice: "已轉移管理權！"
    else
      render :manager
    end
  end

  private

  def find_group_self
    @group = current_user.groups.friendly.find(params[:id])
  end

  def find_group
    @group = Group.friendly.find(params[:id])
  end

  def find_events
    @events = Event.where(group: @group).includes(:store).order(:date)
  end

  def group_params
    params.require(:group).permit(:name, :description)
  end

  def group_manager_params
    params.require(:group).permit(:user_id)
  end
end
