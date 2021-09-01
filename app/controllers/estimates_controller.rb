class EstimatesController < ApplicationController
    
    get '/estimates' do
        erb :'estimates/home'
    end
    
    post '/estimates' do
    end

end