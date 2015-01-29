# Settings default values
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
# Pagination
#

Setting.defaults[:events_pagination] = 30
Setting.defaults[:events_order] = 'title'
Setting.defaults[:events_direction] = 'asc'

#
# Uncategorized
#

Setting.defaults[:birthday_email_toggle] = true
Setting.defaults[:user_registration] = false

Setting.defaults[:user_delete] = true
Setting.defaults[:days_until_delete] = 10