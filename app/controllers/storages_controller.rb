class StoragesController < ApplicationController
  def new
  end

  def index
    @storages = Storage.all
  end

  def show
    @storage = Storage.find(params[:id])
  end

  def create
    @storage = Storage.new(storage_params)

    @storage.save
    redirect_to @storage

    private
     def storage_params
         params.require(:storage).permit(:title, :url)
     end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end