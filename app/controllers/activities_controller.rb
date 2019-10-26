class ActivitiesController < ApplicationController

  get '/activities' do
    if logged_in?
      @activities = Activity.all
      erb :'activities/activities'
    else
      redirect to '/login'
    end
  end

  get '/activities/new' do
    if logged_in?
      erb :'activities/create_activity'
    else
      redirect to '/login'
    end
  end

end
