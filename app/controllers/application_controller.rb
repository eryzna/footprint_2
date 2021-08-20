require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'footprint_secret'
  end

  get '/' do
    erb :'/index'
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def total_credits
      if params[:activity_type]== "commute"
        params[:credits]= 10 * params[:length].to_i
      elsif params[:activity_type] == "food"
        params[:credits]= 20 * params[:length].to_i
      elsif params[:activity_type] == "home"
        params[:credits]= 30 * params[:length].to_i
      elsif params[:activity_type] == "outreach"
        params[:credits] = 40 * params[:length].to_i
      end
    end

  end

end
