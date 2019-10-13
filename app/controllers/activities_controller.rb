class ActivitiesController < ApplicationController

  get '/activities' do
    if logged_in?
      @activities = Activity.all
      erb :'activities/activities'
    else
      redirect to '/login'
    end
  end

end
