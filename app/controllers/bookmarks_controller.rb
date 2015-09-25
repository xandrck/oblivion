class BookmarksController < ApplicationController
  before_action :find_bookmark, only: [:edit, :update, :destroy]

  def index
    # for specified user
    @bookmarks = Bookmark.all
  end

  def new
    Bookmark.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_bookmark
    BookmarkGroup.where(id: params[:id]).first
  end

  def bookmark_params
  end
end
