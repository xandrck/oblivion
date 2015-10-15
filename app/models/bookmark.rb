class Bookmark < ActiveRecord::Base
  belongs_to :bookmarks_group

  validates :name, :href, :bookmarks_group_id, presence: true
end
