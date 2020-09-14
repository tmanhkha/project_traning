namespace :db do
  task create_roles: :environment do
    puts '-----> Creating role'

    # Create admin role
    Role.create(name: 'Admin', level: 1)
    # Create manager role
    Role.create(name: 'Manager', level: 2)
    # Create guest role
    Role.create(name: 'Guest', level: 3)

    puts '-----> Done create role'
  end
end
