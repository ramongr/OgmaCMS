class Setting < RailsSettings::CachedSettings
  # SITE

  defaults[:site_name]        = 'My Website'
  defaults[:site_description] = 'My Description'
  defaults[:site_logo]        = 'My_Site_Logo.png'

  # I18n

  defaults[:available_languages] = [%w(English en),
                                    %w(Español es),
                                    %w(Français fr),
                                    %w(Italiano it),
                                    %w(Português pt)
                                   ]

  defaults[:selected_languages] = [%w(English en)]

  # EMAILS

  defaults[:confirmation_instructions] =
    '<p>Welcome *name*!</p>' \
    '<p>You can confirm your account email through the link below:</p>' \
    '<p>*confirmation_link*</p>'

  defaults[:event_update] =
    '<h1>Hello, *user_name*</h1>' \
    '<p>' \
      'There has been an update in *event_title* we thought we should inform you since you are attending.' \
    '<p>' \
        '*event_description*' \
    '</p>' \
    '<p>Thanks for reading and have a great day!</p>'
end
