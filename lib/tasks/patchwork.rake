namespace :patchwork do
  desc 'This is just a Test'
  task this_is_just_a_test: :environment do
    puts 'Testing 1, 2, 3'
  end
end