# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#####################
# Users
#####################
puts "Adding users"

if User.where(email: 'super_admin@example.com').empty?
  super_admin = User.new name: 'Super Admin', email: 'super_admin@example.com', password: 'password', password_confirmation: 'password', forem_admin: 'true', role: 'super_admin', confirmed_at: Time.now
  super_admin.save!
  puts "Created User Super Admin, super_admin@example.com"
end

if User.where(email: 'admin@example.com').empty?
  admin = User.new name: 'Admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password', forem_admin: 'true', role: 'admin', confirmed_at: Time.now
  admin.save!
  puts "Created User Admin, admin@example.com"
end

if User.where(email: 'author@example.com').empty?
  author = User.new name: 'Author', email: 'author@example.com', password: 'password', password_confirmation: 'password', forem_admin: 'false', role: 'author', confirmed_at: Time.now
  author.save!
  puts "Created User Author, author@example.com"
end

if User.where(email: 'registered@example.com').empty?
  registered = User.new name: 'Registered', email: 'registered@example.com', password: 'password', password_confirmation: 'password', forem_admin: 'false', role: 'registered', confirmed_at: Time.now
  registered.save!
  puts "Created User Registered, registered@example.com"
end
