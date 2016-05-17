class Users::SessionsController < Devise::SessionsController
  # before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super do
      render(json: flash.to_hash, status: :unprocessable_entity) && return
    end
  end

  # POST /resource/sign_in
  def create
    super do
      generate_token = GenerateToken.new
      jwt = generate_token.generate_jwt_token(current_user.uid, current_user.email1)
      render(json: { token: jwt }.to_json) && return
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super do
      jwt = ''
      render(json: { token: jwt }.merge(flash.to_hash)) && return
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
