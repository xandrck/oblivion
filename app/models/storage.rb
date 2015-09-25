class Storage < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :url
end
