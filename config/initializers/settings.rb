# Settings default values

#
# Site
#

Setting.site_name        = 'My Website'
Setting.site_description = 'My Description'
Setting.site_logo        = 'My_Site_Logo.png'

#
# I18n
#

Setting.available_languages = %w(en es fr it pt)
Setting.selected_languages = %w(en pt)

#
# Email
#

Setting.confirmation_instructions =
  '<p>Welcome *name*!</p>' \
  '<p>You can confirm your account email through the link below:</p>' \
  '<p>*confirmation_link*</p>'

Setting.event_update =
  '<h1>Hello, *user_name*</h1>' \
  '<p>' \
    'There has been an update in *event_title* we thought we should inform you since you are attending.' \
  '<p>' \
      '*event_description*' \
  '</p>' \
  '<p>Thanks for reading and have a great day!</p>'