class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to '/features'
    else
      erb :'users/signup'
    end
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
    if logged_in?
      redirect to '/features'
    else
      erb :'users/login'
    end
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

  get '/logout' do
    if logged_in?
      session.clear
    end
    redirect to '/login'
  end

end
