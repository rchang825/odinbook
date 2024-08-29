# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
user1 = User.create! :name => 'User 1', :email => 'user1@mail.com', :password => 'password', :password_confirmation => 'password'
user2 = User.create! :name => 'User 2', :email => 'user2@mail.com', :password => 'password', :password_confirmation => 'password'
user3 = User.create! :name => 'User 3', :email => 'user3@mail.com', :password => 'password', :password_confirmation => 'password'
user4 = User.create! :name => 'User 4', :email => 'user4@mail.com', :password => 'password', :password_confirmation => 'password'
user5 = User.create! :name => 'User 5', :email => 'user5@mail.com', :password => 'password', :password_confirmation => 'password'
user6 = User.create! :name => 'User 6', :email => 'user6@mail.com', :password => 'password', :password_confirmation => 'password'

user1.fans.push(user2)
user1.fans.push(user3)
user1.fans.push(user6)

user2.fans.push(user4)
user2.fans.push(user1)

user3.fans.push(user1)
user3.fans.push(user2)
user3.fans.push(user5)
user3.fans.push(user6)
