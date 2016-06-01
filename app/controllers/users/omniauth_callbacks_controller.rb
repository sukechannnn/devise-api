class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]
  # alias_method :twitter, :all
  #
  # def all
  #   binding.pry
  # end

  # You should also create an action method in this controller like this:
  def all
    service_params = request.env['omniauth.params']['service'].to_i
    auth = request.env['omniauth.auth']
    if check_omniauth(auth, service_params)
      response_omniauth(auth, service_params)
    else
      flash[:alert] = I18n.t 'errors.messages.already_confirmed'
      render(json: flash.to_hash, status: :ok) && return
    end
  end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  private

  alias twitter all
  alias facebook all

  def check_omniauth(auth, service_params)
    if service_params == 2
      User.where("id_#{auth.provider}".to_sym == auth.uid).empty?
    else
      User.where("#{auth.provider}_id".to_sym == auth.uid).empty?
    end
  end

  def response_omniauth(auth, service_params)
    if service_params == 2
      render(json: { "id_#{auth.provider}".to_sym => auth.uid }, status: :ok) && return
    else
      render(json: { "#{auth.provider}_id".to_sym => auth.uid }, status: :ok) && return
    end
  end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
