class RegistrationsController < Devise::RegistrationsController
  def unsubscribe
    @user = User.find_by unsubscribe_token: params[:token]
    respond_to do |format|
      if @user.update(newsletter_subscribed: false)
        format.html { redirect_to edit_user_registration_path, notice: 'Newsletters unsubscribed.' }
      end
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :dob, :nationality, :gender, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :dob, :nationality, :gender, :password, :password_confirmation, :current_password, :newsletter_subscribed)
  end
end
