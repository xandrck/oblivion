class BookmarksController < ApplicationController
  before_action :find_bookmark, only: [:edit, :update, :destroy]
  before_action :find_bookmark_groups, only: [:index, :new, :create, :edit, :update]

  def index
    @bookmarks = Bookmark.where(bookmark_group_id: @bookmark_groups.ids)
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    bookmark_group = BookmarkGroup.where(id: bookmark_params[:bookmark_group_id]).first

    if bookmark_group.nil?
      flash[:alert] = 'Неверная группа закладок.'
      render action: :new
    elsif @bookmark.save
      flash[:notice] = 'Закладка успешно создана.'
      redirect_to bookmarks_path
    else
      flash[:alert] = 'Закладка не была создана.'
      render action: :new
    end
  end

  def edit
  end

  def update
    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = 'Закладка успешно обновлена.'
      redirect_to bookmarks_path
    else
      flash[:alert] = 'Закладка не была обновлена.'
      render action: :edit
    end
  end

  def destroy
    if @bookmark.destroy
      flash[:notice] = 'Закладка успешно удалена.'
    else
      flash[:alert] = 'Закладка не была удалена.'
    end
    redirect_to bookmarks_path
  end

  private

  def find_bookmark
    @bookmark = Bookmark.where(id: params[:id]).first
  end

  def find_bookmark_groups
    @bookmark_groups = current_user.bookmark_groups
  end

  def bookmark_params
    params.require(:bookmark).permit(:name, :href, :bookmark_group_id)
  end
end
