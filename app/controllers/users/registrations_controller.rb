class Users::RegistrationsController < Devise::RegistrationsController
  # before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super do
      if resource.persisted?
        if resource.service == 2
          create_ferret_plus_user(resource)
          unconfirmed_response && return
        elsif resource.active_for_authentication?
          sign_up(resource_name, resource)
          generate_token = GenerateToken.new
          jwt = generate_token.generate_jwt_token(current_user.uid, current_user.email1)
          render(json: { token: jwt }.to_json) && return
        else
          unconfirmed_response && return
        end
      end
    end
  end

  def create_ferret_plus_user(resource)
    resource.regdate = resource.created_at
    resource.created_at = nil
    resource.save
  end

  def unconfirmed_response
    flash[:alert] = t 'devise.failure.unconfirmed'
    render(json: flash.to_hash, status: :ok)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  def destroy
    resource.email1 = '000@000.000'
    resource.memstate = 9
    resource.nname = 'DELETE'
    resource.save(validate: false)
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed
    jwt = ''
    render(json: { token: jwt }.to_json) && return
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
