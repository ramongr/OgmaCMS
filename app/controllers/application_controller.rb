class ApplicationController < ActionController::Base
  before_action :set_i18n_locale

  def user_language
    unless current_user.try(:language).nil?
      current_user.language.to_sym
    else
      http_accept_language.compatible_language_from(Setting.selected_languages.map(&:second))
    end
  end

  def set_i18n_locale
    if Setting.selected_languages.map(&:second).include?(params[:locale]) 
      if params[:locale] && params[:locale] != I18n.locale
        I18n.locale = params[:locale]
        if user_signed_in?
          current_user.language = I18n.locale
          current_user.save
        end
      else
        I18n.locale = user_language
      end
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end

  helper ApplicationHelper

  def forem_user
    current_user
  end
  helper_method :forem_user


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
