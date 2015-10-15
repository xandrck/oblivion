class RenameBookmarkGroups < ActiveRecord::Migration
  def self.up
    rename_table :bookmark_groups, :bookmarks_groups
    rename_column :bookmarks, :bookmark_group_id, :bookmarks_group_id
  end

  def self.down
    rename_table :bookmarks_groups, :bookmark_groups
    rename_column :bookmarks, :bookmarks_group_id, :bookmark_group_id
  end
end
