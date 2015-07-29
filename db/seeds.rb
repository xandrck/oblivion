ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
next if table == 'schema_migrations'
ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
end

user = User.find_by_email('default_user@test.com')
unless user
user = User.new(full_name: 'Default User', email: 'default_user@test.com', password: 'password123')
user.save!
end