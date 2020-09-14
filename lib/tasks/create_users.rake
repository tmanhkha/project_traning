namespace :db do
  task create_users: :environment do
    puts '-----> Creating users'

    # Create admin
    admin_role = Role.find_by(level: 1)
    admin = User.create(email: 'admin@gmail.com', password: 123456, password_confirmation: 123456)
    admin.create_user_role(role_id: admin_role.id)
    # Create manager
    manager_role = Role.find_by(level: 2)
    manager = User.create(email: 'manager@gmail.com', password: 123456, password_confirmation: 123456)
    manager.create_user_role(role_id: manager_role.id)
    # Create guest
    guest_role = Role.find_by(level: 3)
    guest = User.create(email: 'guest@gmail.com', password: 123456, password_confirmation: 123456)
    guest.create_user_role(role_id: guest_role.id)

    puts 'Done create users'
  end
end
