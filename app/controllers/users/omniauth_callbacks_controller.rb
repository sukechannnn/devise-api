class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include ReturnJwt

  def all
    service_params = request.env['omniauth.params']['service'].to_i
    auth = request.env['omniauth.auth']
    if auth.provider == 'yahoojp'
      check_yahoojp(auth, service_params)
    elsif omniauth_exists?(auth, service_params)
      current_user = current_user_data(auth, service_params)
      return redirect_login_url(auth, service_params) if current_user.email1.blank? || current_user.passwd.blank?
      session[:jwt] = return_jwt(current_user)
      redirect_app_url(service_params) && return
    else
      redirect_login_url(auth, service_params)
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
    return User.exists?("id_#{auth.provider}".to_sym => auth.uid) if service_params == FerretApplication.plus
    User.exists?("#{auth.provider}_id".to_sym => auth.uid)
  end

  def current_user_data(auth, service_params)
    return User.find_by("id_#{auth.provider}".to_sym => auth.uid) if service_params == FerretApplication.plus
    User.find_by("#{auth.provider}_id".to_sym => auth.uid)
  end

  def redirect_login_url(auth, service_params)
    sns_id = make_sns_id(auth, service_params)
    case service_params
    when FerretApplication.plus
      redirect_after_oauth 'plus_login_url', sns_id
    when FerretApplication.media
      redirect_after_oauth 'media_login_url', sns_id
    when FerretApplication.marketers_store
      redirect_after_oauth 'marketers_store_login_url', sns_id
    when FerretApplication.contents_writing
      redirect_after_oauth 'contents_writing_login_url', sns_id
    end
  end

  def redirect_app_url(service_params)
    case service_params
    when FerretApplication.plus
      redirect_after_oauth 'plus_url'
    when FerretApplication.media
      redirect_after_oauth 'media_url'
    when FerretApplication.marketers_store
      redirect_after_oauth 'marketers_store_url'
    when FerretApplication.contents_writing
      redirect_after_oauth 'contents_writing_url'
    end
  end

  def redirect_after_oauth(service_url, sns_id=nil)
    redirect_to FerretApplication.send(service_url), flash: sns_id
  end

  def make_sns_id(auth, service_params)
    return { "id_#{auth.provider}".to_sym => auth.uid } if service_params == FerretApplication.plus
    { "#{auth.provider}_id".to_sym => auth.uid }
  end

  # oauth yahoojp_id 認証がferret mediaにのみ対応しているので、これだけ別メソッドに切り出し。
  def check_yahoojp(auth, service_params)
    if service_params != FerretApplication.media
      render(json: (t 'errors.messages.forbidden').to_s, status: :forbidden) && return
    elsif User.exists?(yahoojp_id: auth.uid)
      current_user = User.find_by(yahoojp_id: auth.uid)
      return redirect_login_url(auth, service_params) if current_user.email1.blank? || current_user.passwd.blank?
      session[:jwt] = return_jwt(current_user)
      redirect_app_url(service_params) && return
    else
      redirect_login_url(auth, service_params)
    end
  end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
