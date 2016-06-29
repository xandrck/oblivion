class Bookmark < ActiveRecord::Base
  belongs_to :bookmarks_group

  validates :name, :bookmarks_group_id, presence: true
  validates :href, format: URI::regexp(%w(http https)), presence: true
end
