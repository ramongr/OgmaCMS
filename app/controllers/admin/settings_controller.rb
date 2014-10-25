class Admin::SettingsController < Admin::AdminController
  load_and_authorize_resource

  def index
    @system_mails = SystemMail.all
  end

  def update_all
    errors = []
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

    # I18N
    selected_languages = []
    Setting.available_languages.each do |l|
      if params.key?('i18n_' + l)
        selected_languages << l
      end
    end
    unless selected_languages.empty?
      if selected_languages.include?(params[:default_language])
        Setting.selected_languages = selected_languages
      else
        errors << t('settings.errors.deselect_default')
      end
    else
      errors << t('settings.errors.select_at_least_one_language')
    end

    if I18n.default_locale.to_s != params[:default_language]
      if Setting.available_languages.include?(params[:default_language])
        I18n.default_locale = params[:default_language]
      else
        errors << t('settings.errors.default_language_not_available')
      end
    end

    if errors.empty?
      redirect_to admin_settings_url, notice: t('settings.notice.save_success')
    else
      redirect_to admin_settings_url, alert: errors.join(', ')
    end
  end
end
