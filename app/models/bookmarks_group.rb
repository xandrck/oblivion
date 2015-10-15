class BookmarksGroup < ActiveRecord::Base
  has_many :bookmarks, dependent: :destroy
  belongs_to :user
end