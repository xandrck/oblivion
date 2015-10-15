class Bookmark < ActiveRecord::Base
  belongs_to :bookmark_group

  validates :name, :href, :bookmark_group_id, presence: true
end
