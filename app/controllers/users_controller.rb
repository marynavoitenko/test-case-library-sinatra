class UsersController < ApplicationController
  use Rack::Flash

  get '/signup' do
    if logged_in?
      redirect to '/features'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      redirect to '/features'
    else
      flash[:message] = "Something went wrong. Please try again."
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
      flash[:message] = "Something went wrong. Please try again."
      redirect to '/login'
    end
  end

  get '/users/:id' do
    if user = User.find(params[:id])
      @testcases = user.testcases
      erb :'users/show'
    else
      redirect to '/features'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
    end
    redirect to '/login'
  end

end
