# Settings default values

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

if SystemMail.where(name: 'Email confirmation instructions').empty?
  SystemMail.create name: 'Email confirmation instructions', 
                    subject: 'Confirmation Instructions', 
                    content: '<p>Welcome *name*!</p>' \
                             '<p>You can confirm your account email through the link below:</p>' \
                             '<p>*confirmation_link*</p>'
end

if SystemMail.where(name: 'Event update').empty?
  SystemMail.create name: 'Event Update',
                    subject: 'Event Update',
                    content: '<h1>Hello, *user_name*</h1>' \
                             '<p>' \
                               'There has been an update in *event_title* we thought we should inform you since you are attending.' \
                             '<p>' \
                                '*event_description*' \
                             '</p>' \
                             '<p>Thanks for reading and have a great day!</p>'
end