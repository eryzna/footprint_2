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

  post '/activities' do
    if logged_in?
      if params[:activity] == ""
        redirect to "/activities/new"
      else
        @activity = Activity.create
        @activity.name = params[:name]
        @activity.activity_type = params[:activity_type]
        if @activity.activity_type== "commute"
          @activity.credits= 100
        elsif @activity.activity_type == "food"
          @activity.credits= 200
        elsif @activity.activity_type == "home"
          @activity.credits= 300
        elsif @activity.activity_type == "outreach"
          @activity.credits = 400
        end
        @activity.length = params[:length]
        @activity.user = current_user
        @activity.save
        if @activity.save
          redirect to "/activities/#{@activity.id}"
        else
         redirect to '/activities/new'
        end
      end
    else
      redirect to '/login'
    end
  end

  get '/activities/:id' do
    if logged_in?
      @activity = Activity.find_by_id(params[:id])
      erb :'activities/show_activity'
    else
      redirect to '/login'
    end
  end

  get '/activities/:id/edit' do
    if logged_in?
      @activity = Activity.find_by_id(params[:id])
      if @activity && @activity.user == current_user
        erb :'activities/edit_activity'
      else
        redirect to '/activities'
      end
    else
      redirect to '/login'
    end
  end

  patch '/activities/:id' do
    if logged_in?
      if params[:activity_type]== "" || params[:length]== ""
        redirect to '/activities/#{params[:id]}/edit'
      else
        @activity= Activity.find_by_id(params[:id])
        if @activity && @activity.user == current_user
          if @activity.update(activity_type: params[:activity_type], length: params[:length])
            redirect to "/activities/#{@activity.id}"
          else
            redirect to "/activities/#{@activity.id}/edit"
          end
        end
      end
    else
      redirect to '/activities'
    end
  end

  delete '/activities/:id/delete' do
    if logged_in?
      @activity = Activity.find_by_id(params[:id])
      if @activity && @activity.user == current_user
        @activity.delete
      end
      redirect to '/activities'
    else
      redirect to '/login'
    end
  end


end
