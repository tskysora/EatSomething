class StoresController < ApplicationController
  before_action :find_store, only: [:edit, :update]

  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)

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
      redirect_to edit_store_path(@store), notice: '資料更新成功！'
    else
      render :edit
    end
  end

  private

  def find_store
    @store = Store.find(params[:id])  
  end

  def store_params
    params.require(:store).permit(:name, :branch, :city, :district, :street_address, :tel, :note, :online)
  end
end
