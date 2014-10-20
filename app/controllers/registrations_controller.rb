class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def update
    @user = User.find(current_user.id)

    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
    else
      # remove the virtual current_password attribute
      # update_without_password doesn't know how to ignore it
      params[:user].delete(:current_password)
      @user.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case their password changed
      sign_in @user, bypass: true
      redirect_to edit_user_registration_path
    else
      render "edit"
    end
  end

  def unsubscribe
    @user = User.find_by unsubscribe_token: params[:token]
    respond_to do |format|
      if @user.update(newsletter_subscribed: false)
        format.html { redirect_to edit_user_registration_path, notice: 'Newsletters unsubscribed.' }
      end
    end
  end

  private

  # check if we need password to update user data
  def needs_password?(user, params) 
    user.email != params[:user][:email] ||
      params[:user][:password].present? ||
      params[:user][:password_confirmation].present?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :email, :dob, :country, :language, :gender, :newsletter_subscribed, :password, :password_confirmation, :current_password)
    end
  end

end
