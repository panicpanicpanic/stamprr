class SessionsController < ApplicationController

  def create
    auth = request.env['omniauth.auth']
    email =  auth['extra']['raw_info']['email']
    user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) || User.create_with_omniauth(auth)

    if email.include?([PROPRIETAY :)])
      session[:user_id] = user.id
      redirect_to brands_path, :notice => "Welcome to Taglandia!"
    else
      redirect_to "/fail"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end


end
