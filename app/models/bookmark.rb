class Bookmark < ActiveRecord::Base
  belongs_to :bookmark_group

  validates_presence_of :name, :href, :bookmark_groups_id
end
