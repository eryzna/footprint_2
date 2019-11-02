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
      if @activity.activity_type== "commute"
        @activity.credits= 10 * @activity.length
      elsif @activity.activity_type == "food"
        @activity.credits= 20 * @activity.length
      elsif @activity.activity_type == "home"
        @activity.credits= 30 * @activity.length
      elsif @activity.activity_type == "outreach"
        @activity.credits = 40 * @activity.length
      end
    end

    def credits_total
    end

  end

end
