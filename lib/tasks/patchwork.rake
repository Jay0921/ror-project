namespace :patchwork do
  desc 'This is just a Test'
  task this_is_just_a_test: :environment do
    puts 'Testing 1, 2, 3'
  end

  desc 'Create Super Admin User'
  task create_super_admin_user: :environment do
    User.create(email: 'super_admin@gmail.com', password: '13572468', role: User.roles[:super_admin])
  end
end