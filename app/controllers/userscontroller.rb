require './config/environment'

class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show_user'
  end

  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect to '/activities'
    end
  end
end
