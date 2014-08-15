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
  super_admin = User.new name: 'Super Admin', email: 'super_admin@example.com', password: 'password', password_confirmation: 'password', forem_admin: 'true', role: 'super_admin'
  super_admin.save!
  puts "Created User Super Admin, super_admin@example.com"
end

if User.where(email: 'admin@example.com').empty?
  admin = User.new name: 'Admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password', forem_admin: 'true', role: 'admin'
  admin.save!
  puts "Created User Admin, admin@example.com"
end

if User.where(email: 'author@example.com').empty?
  author = User.new name: 'Author', email: 'author@example.com', password: 'password', password_confirmation: 'password', forem_admin: 'false', role: 'author'
  author.save!
  puts "Created User Author, author@example.com"
end

if User.where(email: 'registered@example.com').empty?
  registered = User.new name: 'Registered', email: 'registered@example.com', password: 'password', password_confirmation: 'password', forem_admin: 'false', role: 'registered'
  registered.save!
  puts "Created User Registered, registered@example.com"
end

#####################
# Links
#####################
puts "Adding links"


if Link.where(value: (Rails.application.routes.url_helpers.new_user_session_path)).empty?
  logout_link = Link.new title: 'LogIn', type_mask: 0, value: (Rails.application.routes.url_helpers.new_user_session_path)
  logout_link.save!
  puts "Created Login Link, "+ Rails.application.routes.url_helpers.new_user_session_path
end

if Link.where(value: (Rails.application.routes.url_helpers.new_user_registration_path)).empty?
  signin_link = Link.new title: 'SignIn', type_mask: 0, value: (Rails.application.routes.url_helpers.new_user_registration_path)
  signin_link.save!
  puts "Created SignIn Link, "+ Rails.application.routes.url_helpers.new_user_registration_path
end

if Link.where(value: (Rails.application.routes.url_helpers.visitor_comments_path)).empty?
  signin_link = Link.new title: 'Visitors Book', type_mask: 0, value: (Rails.application.routes.url_helpers.visitor_comments_path)
  signin_link.save!
  puts "Created Visitors Book Link, "+ Rails.application.routes.url_helpers.visitor_comments_path
end

if Link.where(value: (Rails.application.routes.url_helpers.static_pages_path)).empty?
  signin_link = Link.new title: 'Public Pages', type_mask: 0, value: (Rails.application.routes.url_helpers.static_pages_path)
  signin_link.save!
  puts "Created Public Static Pages Link, "+ Rails.application.routes.url_helpers.static_pages_path
end

if Link.where(value: (Rails.application.routes.url_helpers.posts_path)).empty?
  signin_link = Link.new title: 'Posts', type_mask: 0, value: (Rails.application.routes.url_helpers.posts_path)
  signin_link.save!
  puts "Created Public Static Pages Link, "+ Rails.application.routes.url_helpers.posts_path
end

if Link.where(value: '/forum/').empty?
  signin_link = Link.new title: 'Forum', type_mask: 0, value: '/forum/'
  signin_link.save!
  puts "Created Forum Link, "+ '/forum/'
end



#####################
# Sidebars
#####################
puts "Adding links"

if Sidebar.where(type_mask: 0).empty?
  top_sidebar = Sidebar.new title: 'Left Sidebar', type_mask: 0, :links => Link.where(:title => ['LogIn', 'SignIn', 'Visitors Book', 'Forum', 'Public Pages', 'Posts'])
  top_sidebar.save!
  puts "Created Left Sidebar"
end

if Sidebar.where(type_mask: 1).empty?
  top_sidebar = Sidebar.new title: 'Right Sidebar', type_mask: 1, :links => Link.where(:title => ['LogIn', 'SignIn', 'Visitors Book', 'Forum', 'Public Pages', 'Posts'])
  top_sidebar.save!
  puts "Created Right Sidebar"
end

if Sidebar.where(type_mask: 2).empty?
  top_sidebar = Sidebar.new title: 'Top Sidebar', type_mask: 2, :links => Link.where(:title => ['LogIn', 'SignIn', 'Visitors Book', 'Forum', 'Public Pages', 'Posts'])
  top_sidebar.save!
  puts "Created Top Sidebar"
end

if Sidebar.where(type_mask: 3).empty?
  top_sidebar = Sidebar.new title: 'Bottom Sidebar', type_mask: 3, :links => Link.where(:title => ['LogIn', 'SignIn', 'Visitors Book', 'Forum', 'Public Pages', 'Posts'])
  top_sidebar.save!
  puts "Created Bottom Sidebar"
end