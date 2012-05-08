require "instagram"

class SessionController < ApplicationController
  
  def connect
    puts "----------- SESSION CONNECT CALLED"
    redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    session[:access_token] = response.access_token
    redirect_to :controller => 'photos', :action => 'index'
  end
  
end