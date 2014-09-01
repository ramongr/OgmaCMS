class ApplicationController < ActionController::Base
  before_action :set_i18n_locale

  def user_language
    unless current_user.try(:language).nil?
      current_user.language.to_sym
    else
      http_accept_language.compatible_language_from(Setting.available_languages.map(&:second))
    end
  end

  def set_i18n_locale
    I18n.locale = params[:locale] || user_language
  end

  def forem_user
    current_user
  end
  helper_method :forem_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
