module BookmarksHelper
  def group_name(group_id)
    group = BookmarksGroup.where(id: group_id).first
    group.name if group.present?
  end
end
