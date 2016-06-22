class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include ReturnJwt

  def all
    service_params = request.env['omniauth.params']['service'].to_i
    auth = request.env['omniauth.auth']
    if auth.provider == 'yahoojp'
      check_yahoojp(auth, service_params)
    elsif omniauth_exists?(auth, service_params)
      current_user = current_user_data(auth, service_params)
      return_omniauth_id(auth, service_params) if current_user.email1.blank? || current_user.passwd.blank?
      render(json: { token: return_jwt(current_user) }.to_json) && return
    else
      return_omniauth_id(auth, service_params)
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

  def current_user_data(auth, service_params)
    if service_params == Settings.ferret.plus
      User.find_by("id_#{auth.provider}".to_sym => auth.uid)
    else
      User.find_by("#{auth.provider}_id".to_sym => auth.uid)
    end
  end

  def return_omniauth_id(auth, service_params)
    sns_id = make_sns_id(auth, service_params)
    case service_params
    when Settings.ferret.plus
      redirect_after_oauth 'plus_url', sns_id
    when Settings.ferret.media
      redirect_after_oauth 'media_url', sns_id
    when Settings.ferret.marketers_store
      redirect_after_oauth 'marketers_store_url', sns_id
    when Settings.ferret.contents_writing
      redirect_after_oauth 'contents_writing_url', sns_id
    end
  end

  def redirect_after_oauth(service_url, sns_id)
    redirect_to Settings.ferret.send(service_url), flash: sns_id
  end

  def make_sns_id(auth, service_params)
    return { "id_#{auth.provider}".to_sym => auth.uid } if service_params == Settings.ferret.plus
    { "#{auth.provider}_id".to_sym => auth.uid }
  end

  # oauth yahoojp_id 認証がferret mediaにのみ対応しているので、これだけ別メソッドに切り出し。
  def check_yahoojp(auth, service_params)
    if service_params != Settings.ferret.media
      render(json: (t 'errors.messages.forbidden').to_s, status: :forbidden) && return
    elsif User.exists?(yahoojp_id: auth.uid)
      current_user = User.find_by(yahoojp_id: auth.uid)
      return_omniauth_id(auth, service_params) if current_user.email1.blank? || current_user.passwd.blank?
      render(json: { token: return_jwt(current_user) }.to_json) && return
    else
      return_omniauth_id(auth, service_params)
    end
  end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
