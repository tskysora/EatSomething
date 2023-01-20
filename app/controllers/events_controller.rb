class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_group, only: [:new, :create]
  before_action :find_event, only: [:edit, :update, :show, :destroy]
  
  def index
    find_events_expired
    find_events_unexpired
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.new(event_params)
    
    if @event.save
      redirect_to events_path, notice: '新增活動成功！'
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: "活動更新成功！"
    else
      render :edit
    end
  end

  def show
    
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "活動刪除成功！", status: :see_other
  end

  def find_events_expired
    @events = Event.where(group: current_user.participated_groups).includes(:group, :store, :user).order(date: :desc)
    @events_expired = @events.select { |event| event.date < 1.day.ago }
  end

  def find_events_unexpired
    @events = Event.where(group: current_user.participated_groups).includes(:group, :store, :user).order(date: :asc)
    @events_unexpired = @events.select { |event| event.date > 1.day.ago }
  end

  private
  
  def find_group
    @group = Group.find_by(slug: params[:group])
  end

  def find_event
    @event = Event.friendly.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:date, :store_id, :period, :group_id)
  end
end