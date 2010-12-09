class SessionsController < ApplicationController
  def new
    @user = client.user(session[:screen_name]) if signed_in?
  end

  def create
    sign_in(request.env['omniauth.auth']['extra']['user_hash'])
    redirect_to root_path, :notice => "Signed in to Twitter!"
  end

  def error
    redirect_to root_path, :alert => "Sign in with Twitter failed!"
  end

  def destroy
    reset_session
    redirect_to root_path, :notice => "Signed out!"
  end
end
