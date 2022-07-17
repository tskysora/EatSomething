class StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :find_store, only: [:edit, :update, :show]

  def index
    @stores = current_user.stores.order(created_at: :desc)
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
  
  def show
    
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

  private

  def find_store
    @store = current_user.stores.find(params[:id])  
  end

  def store_params
    params.require(:store).permit(:name, :branch, :city, :district, :street_address, :tel, :note, :online,
                                  meals_attributes: [ :id, :name, :price, :description, :_destroy]
                                  )
  end
end
