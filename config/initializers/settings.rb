# # Settings default values
Setting.save_default(:backup, true) if ActiveRecord::Base.connection.table_exists? 'settings'
#
# Site
#

Setting.defaults[:site_name]        = 'My Website'
Setting.defaults[:site_description] = 'My Description'
Setting.defaults[:site_logo]        = 'My_Site_Logo.png'

#
# I18n
#

Setting.defaults[:available_languages] = %w(en es fr it pt)
Setting.defaults[:selected_languages] = %w(en pt)
Setting.defaults[:default_time_zone] = 'UTC'

#
# Email
#

Setting.defaults[:confirmation_instructions] =
  '<p>Welcome *name*!</p>' \
  '<p>You can confirm your account email through the link below:</p>' \
  '<p>*confirmation_link*</p>'

Setting.defaults[:event_update] =
  '<h1>Hello, *user_name*</h1>' \
  '<p>' \
    'There has been an update in *event_title* we thought we should inform you since you are attending.' \
  '<p>' \
      '*event_description*' \
  '</p>' \
  '<p>Thanks for reading and have a great day!</p>'

  Setting.defaults[:birthday_email_toggle] = true