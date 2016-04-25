class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_account_update_params, only: [:update]

  respond_to :json
  # POST /resource
  def create
    user = User.new(configure_sign_up_params)
    if user.save
      # TODO: pardotへ送る
      render json: user.as_json(only: :uid), status: 201
      return
    else
      warden.custom_failure!
      render json: user.errors, status: 422
    end
  end

  protected

  def configure_sign_up_params
    params.require(:user).permit(
      :email, :password, :password_confirmation
    )
  end

end
