class Auth0Controller < ApplicationController
  def callback
    session[:userinfo] = request.env['omniauth.auth']

    redirect_to session[:return_url]
  end

  def failure
    @error_msg = request.params['message']
  end

  def logout
    session[:userinfo] = nil
    redirect_to "https://pauls-blog.eu.auth0.com/v2/logout?returnTo=#{ENV.fetch('LOGOUT_URL')}&#{ENV.fetch('ClIENT_ID')}"
  end
end