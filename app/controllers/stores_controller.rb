class StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :find_store, only: [:edit, :update, :destroy]

  def index
    @stores = current_user.stores.includes(:meals).order(created_at: :desc)
  end
  
  def new
    @store = current_user.stores.new
    @store.meals.build
  end
  
  def create
    @store = current_user.stores.new(store_params)
    
    if @store.save
      redirect_to stores_path, notice: '新增店家成功！'
    else
      render :new
    end
  end
  
  def edit
    
  end

  def update
    if @store.update(store_params)
      redirect_to stores_path, notice: '資料更新成功！'
    else
      render :edit
    end
  end
  
  def destroy
    @store.destroy
    redirect_to stores_path, notice: '店家已刪除！'
  end

  private

  def find_store
    @store = current_user.stores.friendly.find(params[:id])  
  end

  def store_params
    params.require(:store).permit(:name, :branch, :city, :district, :street_address, :tel, :note, :online, :menu,
                                  meals_attributes: [ :id, :name, :price, :description, :_destroy]
                                  )
  end
end
