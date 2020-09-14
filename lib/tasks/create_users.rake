namespace :db do
  task create_users: :environment do
    # Create admin
    admin_role = Role.find_by(level: 1)
    admin = User.create(email: 'admin@gmail.com', password: 123456, password_confirmation: 123456)
    admin.create_user_role(role: admin_role)

    # Create manager
    manager_role = Role.find_by(level: 2)
    manager = User.create(email: 'manager@gmail.com', password: 123456, password_confirmation: 123456)
    manager.create_user_role(role: manager_role)

    # Create guest
    guest_role = Role.find_by(level: 3)
    guest = User.create(email: 'guest@gmail.com', password: 123456, password_confirmation: 123456)
    guest.create_user_role(role: guest_role)

    puts 'Done!'
  end
end
