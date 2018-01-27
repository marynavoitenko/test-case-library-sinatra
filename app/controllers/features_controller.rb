class FeaturesController < ApplicationController

  get '/features' do
    if logged_in?
      @features = Feature.all
      erb :'features/features'
    else
      redirect to '/login'
    end
  end
end
