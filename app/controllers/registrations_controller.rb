class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name,:last_name,:email,:secret_code_id)
  end

  def account_update_params
    params.require(:user).permit(:first_name,:last_name,:email,:secret_code_id)
  end
end

