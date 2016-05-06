class Users::RegistrationsController < Devise::RegistrationsController
  # before_filter :configure_account_update_params, only: [:update]

  # POST /resource
  def create
    super
  end
end
