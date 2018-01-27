class FeaturesController < ApplicationController

  get '/features' do
    if logged_in?
      @features = Feature.all
      erb :'features/index'
    else
      redirect to '/login'
    end
  end

  get '/features/:id' do
    if logged_in?
      @feature = Feature.find(params[:id])
      erb :'features/show'
    else
      redirect to '/login'
    end
  end

end
