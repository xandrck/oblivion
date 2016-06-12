class BookmarksGroupsController < ApplicationController
  before_action :find_bookmarks_group, only: [:show, :edit, :update, :destroy]

  def index
    @bookmarks_groups = current_user.bookmarks_groups
  end

  def new
    @bookmarks_group = BookmarksGroup.new
  end

  def create
    @bookmarks_group = current_user.bookmarks_groups.build(bookmarks_group_params)

    if @bookmarks_group.save
      flash[:notice] = 'Bookmarks group was successfully created.'
      redirect_to bookmarks_groups_path
    else
      flash[:alert] = 'Bookmarks group was not created.'
      render action: :new
    end
  end

  def show
    @bookmarks = @bookmarks_group.bookmarks
  end

  def edit
  end

  def update
    if @bookmarks_group.update_attributes(bookmarks_group_params)
      flash[:notice] = 'Bookmarks group was successfully updated.'
      redirect_to bookmarks_groups_path
    else
      flash[:alert] = 'Bookmarks group was not updated.'
      render action: :edit
    end
  end

  def destroy
    if @bookmarks_group.destroy
      flash[:notice] = 'Bookmarks group was successfully removed.'
    else
      flash[:alert] = 'Bookmarks group was not removed.'
    end
    redirect_to bookmarks_groups_path
  end


  def upload


  end
  private

  def find_bookmarks_group
    @bookmarks_group = BookmarksGroup.where(id: params[:id]).first
  end

  def bookmarks_group_params
    params.require(:bookmarks_group).permit(:name, :user_id)
  end
end
