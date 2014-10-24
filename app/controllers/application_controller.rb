class ApplicationController < ActionController::Base
  before_action :set_i18n_locale

  def user_language
    unless current_user.try(:language).nil?
      if Setting.selected_languages.include?(current_user.language)
        current_user.language.to_sym
      else
        ulang = http_accept_language.compatible_language_from(Setting.selected_languages)
        current_user.update_attribute(:language,ulang)
        ulang
      end
    else
      http_accept_language.compatible_language_from(Setting.selected_languages)
    end
  end

  def set_i18n_locale
    if Setting.selected_languages.include?(params[:locale])
      if params[:locale] != I18n.locale.to_s
        I18n.locale = params[:locale]
        if user_signed_in?
          current_user.update_attribute(:language,I18n.locale.to_s)
        end
      end
    else
      I18n.locale = user_language
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end

  include ApplicationHelper
  helper ApplicationHelper

  def forem_user
    current_user
  end
  helper_method :forem_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
