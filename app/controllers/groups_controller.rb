class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_group, only: [:edit, :update, :destroy]

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
      current_user.join!(@group)
      redirect_to groups_path, notice: "團體新增成功！"
    else
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: "團體更新成功！"
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, notice: "團體刪除成功！"
  end

  def show
    # @group = Group.includes(:members).find(params[:id])
    @group = Group.includes(:members).find_by_invite_token(params[:invite_token])
  end

  def join
    # @group = Group.find(params[:id])
    @group = Group.find_by_invite_token(params[:invite_token])
    if !current_user.member?(@group)
      current_user.join!(@group)
      flash[:notice] = '已成功加入團體！'
    else
      flash[:notice] = '你已經是本團體會員了！'
    end
    redirect_to groups_path
  end

  def quit
    # @group = Group.find(params[:id])
    @group = Group.find_by_invite_token(params[:invite_token])
    if current_user.member?(@group)
      current_user.quit!(@group)
      flash[:notice] = '你已離開此團體！'
    else
      flash[:notice] = '你不是本團體會員！'
    end
    redirect_to groups_path
  end

  private

  def find_group
    # @group = current_user.groups.find(params[:id])
    @group = current_user.groups.find_by_invite_token(params[:invite_token])
  end

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
