class StoragesController < ApplicationController

  before_action :find_storage, only: [:edit, :update, :destroy]

  def new
    @storage = Storage.new
  end

  def index
    @storages = Storage.all
  end

  def show
  end

  def create
    @storage = Storage.new(storage_params)

    if @storage.save
      flash[:notice] = 'Хранилище успешно создано.'
      redirect_to storages_path
    else
      flash[:alert] = 'Хранилище не было создано.'
      render action: :new
    end
  end

  def edit
  end

  def update
    if @storage.update_attributes(storage_params)
      flash[:notice] = 'Хранилище успешно обновлено.'
      redirect_to storages_path
    else
      flash[:alert] = 'Хранилище не было обновлено.'
      render action: :edit
    end
  end

  def destroy
    if @storage.destroy
      flash[:notice] = 'Хранилище успешно удалено.'
    else
      flash[:alert] = 'Хранилище не было удалено.'
    end
  end

  private

    def storage_params
      params.require(:storage).permit(:title, :url)
    end

    def find_storage
      @storage = Storage.where(id: params[:id]).first
    end
end