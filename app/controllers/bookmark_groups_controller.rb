class BookmarkGroupsController < ApplicationController
  before_action :find_bookmark_group, only: [:edit, :update, :destroy]

  def index
    @bookmark_groups = current_user.bookmark_groups
  end

  def new
    @bookmark_group = BookmarkGroup.new
  end

  def create
    @bookmark_group = current_user.bookmark_groups.build(bookmark_group_params)

    if @bookmark_group.save
      flash[:notice] = 'Группа закладок успешно создана.'
      redirect_to bookmark_groups_path
    else
      flash[:alert] = 'Группа закладок не была создана.'
      render action: :new
    end
  end

  def edit
  end

  def update
    if @bookmark_group.update_attributes(bookmark_group_params)
      flash[:notice] = 'Группа закладок успешно обновлена.'
      redirect_to bookmark_groups_path
    else
      flash[:alert] = 'Группа закладок не была обновлена.'
      render action: :edit
    end
  end

  def destroy
    if @bookmark_group.destroy
      flash[:notice] = 'Группа закладок успешно удалена.'
    else
      flash[:alert] = 'Группа закладок не была удалена.'
    end
    redirect_to bookmark_groups_path
  end

  private

  def find_bookmark_group
    @bookmark_group = BookmarkGroup.where(id: params[:id]).first
  end

  def bookmark_group_params
    params.require(:bookmark_group).permit(:name, :user_id)
  end
end
