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
    if auth.provider == 'yahoojp'
      check_yahoojp(auth, service_params)
    elsif omniauth_exists?(auth, service_params)
      flash[:alert] = t 'errors.messages.already_confirmed'
      render(json: flash.to_hash, status: :ok) && return
    else
      response_omniauth(auth, service_params)
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
  alias yahoojp all

  def omniauth_exists?(auth, service_params)
    if service_params == Settings.ferret.plus
      User.exists?("id_#{auth.provider}".to_sym => auth.uid)
    else
      User.exists?("#{auth.provider}_id".to_sym => auth.uid)
    end
  end

  def response_omniauth(auth, service_params)
    if service_params == Settings.ferret.plus
      render(json: { "id_#{auth.provider}".to_sym => auth.uid }, status: :ok) && return
    else
      render(json: { "#{auth.provider}_id".to_sym => auth.uid }, status: :ok) && return
    end
  end

  # oauth yahoojp_id 認証がferret mediaにのみ対応しているので、これだけ別メソッドに切り出し。
  def check_yahoojp(auth, service_params)
    if service_params != Settings.ferret.media
      render(json: (t 'errors.messages.forbidden').to_s, status: :forbidden) && return
    elsif User.exists?(yahoojp_id: auth.uid)
      flash[:alert] = t 'errors.messages.already_confirmed'
      render(json: flash.to_hash, status: :ok) && return
    else
      response_omniauth(auth, service_params)
    end
  end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
