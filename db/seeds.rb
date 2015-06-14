require 'faker'

# Create Users
3.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(8)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Items
15.times do
  Item.create!(
    name: Faker::Lorem.sentence,
    user: users.sample
  )
end

me = User.new(
  name:     'Austin',
  email:    'theaustinpeay@gmail.com',
  password: 'password'
)
me.skip_confirmation!
me.save!

puts "Seed finished"
puts "#{User.count} users created."
puts "#{Item.count} items created."
