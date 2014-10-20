class Admin::SettingsController < Admin::AdminController
  load_and_authorize_resource

  def index
    @system_mails = SystemMail.all
  end

  def update_all
    # SITE
    if Setting.site_name != params[:site_name]
      Setting.site_name = params[:site_name]
    end
    if Setting.site_description != params[:site_description]
      Setting.site_description = params[:site_description]
    end
    if Setting.site_logo != params[:site_logo]
      Setting.site_logo = params[:site_logo]
    end

    # MAILER
    if Setting.confirmation_instructions != params[:confirmation_instructions]
      Setting.confirmation_instructions = params[:confirmation_instructions]
    end

    if Setting.event_update != params[:event_update]
      Setting.event_update = params[:event_update]
    end

    # INTERNATIONALIZATION
    selected_languages = []
    Setting.available_languages.each do |l|
      if params.key?('i18n_' + l)
        selected_languages << l
      end
    end
    if !selected_languages.empty?
      Setting.selected_languages = selected_languages
    else
      redirect_to admin_settings_url, notice: 'You have to select at least one language'
      return
    end

    redirect_to admin_settings_url, notice: 'Settings saved successfully'
  end
end
