ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
end

user = User.find_by_email('default_user@test.com')
unless user
  user = User.create!(full_name: 'Default User', email: 'default_user@test.com', password: 'password123')
end

# Create Bookmark Group with Bookmarks
bookmarks_group = user.bookmarks_groups.where(name: 'Default Group').first
unless bookmarks_group
  bookmarks_group = user.bookmarks_groups.create!(name: 'Default Group')
end

bookmarks_group.bookmarks.create!(name: 'Google', href: 'https://www.google.com')
bookmarks_group.bookmarks.create!(name: 'GitHub', href: 'https://github.com')

p '#####Seeds successful'
