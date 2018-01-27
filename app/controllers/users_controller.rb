class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    user = User.create(params)
    if user
      session[:user_id] = user.id
      redirect to '/features'
    else
      redirect to '/signup'
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(email: params["email"])
    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      redirect to '/features'
    else
      redirect to '/login'
    end
  end

end
