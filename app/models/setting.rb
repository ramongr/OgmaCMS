class Setting < RailsSettings::CachedSettings
  defaults[:site_name]        = 'My Website'
  defaults[:site_subtitle]    = 'My Subtitle'
  defaults[:site_description] = 'My Description'
  defaults[:site_logo]        = 'My_Site_Logo.png'

  defaults[:available_languages] = [['English',   'en'],
                                    ['Español',   'es'],
                                    ['Français',  'fr'],
                                    ['Italiano',  'it'],
                                    ['Português', 'pt']
                                   ]

  defaults[:selected_languages] = [['English','en']]
end
