class BookmarksController < ApplicationController
  before_action :find_bookmark, only: [:edit, :update, :destroy]
  before_action :find_bookmarks_groups, only: [:index, :new, :create, :edit, :update]

  def index
    @bookmarks = Bookmark.where(bookmarks_group_id: @bookmarks_groups.ids)
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    bookmarks_group = BookmarksGroup.where(id: bookmark_params[:bookmarks_group_id]).first

    if bookmarks_group.nil?
      flash[:alert] = 'Wrong bookmarks group.'
      render action: :new
    elsif @bookmark.save
      flash[:notice] = 'Bookmark was successfully created.'
      redirect_to bookmarks_path
    else
      flash[:alert] = 'Bookmark was not created.'
      render action: :new
    end
  end

  def edit
  end

  def update
    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = 'Bookmark was successfully updated.'
      redirect_to bookmarks_path
    else
      flash[:alert] = 'Bookmark was not updated.'
      render action: :edit
    end
  end

  def destroy
    if @bookmark.destroy
      flash[:notice] = 'Bookmark was successfully removed.'
    else
      flash[:alert] = 'Bookmark was not removed.'
    end
    redirect_to bookmarks_path
  end

  private

  def find_bookmark
    @bookmark = Bookmark.where(id: params[:id]).first
  end

  def find_bookmarks_groups
    @bookmarks_groups = current_user.bookmarks_groups
  end

  def bookmark_params
    params.require(:bookmark).permit(:name, :href, :bookmarks_group_id)
  end
end
