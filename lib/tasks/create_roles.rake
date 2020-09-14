namespace :db do
  task create_roles: :environment do
    Role.create(name: 'Admin', level: 1)
    Role.create(name: 'Manager', level: 2)
    Role.create(name: 'Guest', level: 3)

    puts 'Done!'
  end
end
