class TraysController < ApplicationController
  before_action :authenticate_user!
  before_action :find_tray, only: [:update]

  def new
    @tray = current_user.trays.new
    # @tray = Tray.new
    @tray.tray_items.build
  end

  def create
    # Tray.where(event: @event, user: current_user).first_or_create
    @tray = current_user.trays.new(tray_params)

    if @tray.save!
      redirect_to events_path, notice: '新增成功！'
    else
      render 'events/show', status: :unprocessable_entity, content_type: "text/html"
      headers["Content-Type"] = "text/html"
    end
  end

  def update
    if @tray.update!(tray_params)
      redirect_to events_path, notice: "餐盤更新成功！"
    else
      render 'events/show', status: :unprocessable_entity, content_type: "text/html"
      headers["Content-Type"] = "text/html"
    end
  end

  private
  def find_event
    @event = Event.friendly.find(params[:id])
  end

  def find_tray
    @tray = Tray.find(params[:id])
  end
  
  def tray_params
    params.require(:tray).permit(:event_id,
                                 tray_items_attributes: [:id, :meal_id, :quantity, :note, :_destroy ] )
  end
end
