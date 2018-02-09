class TestcasesController < ApplicationController

  get '/testcases' do
    if logged_in?
      @testcases = Testcase.all
      erb :'/testcases/index'
    else
      redirect to '/login'
    end
  end

  get '/testcases/new' do
    if logged_in?
      erb :'testcases/new'
    else
      redirect to '/login'
    end
  end

  post '/testcases' do
    @testcase = current_user.testcases.create(params[:testcase])
    if logged_in? && @testcase
      if !params[:feature][:title].empty?
        @testcase.features << Feature.create(params[:feature])
      end
      redirect to "/testcases/#{@testcase.id}"
    else
      redirect to 'testcases/new'
    end
  end

  get '/testcases/:id' do
    if logged_in?
      @testcase = Testcase.find(params[:id])
      erb :'testcases/show'
    else
      redirect to '/login'
    end
  end

  get '/testcases/:id/edit' do
    if logged_in?
      @testcase = Testcase.find(params[:id])
      if current_user.testcases.include?(@testcase)
        erb :'testcases/edit'
      else
        redirect to "testcases/#{@testcase.id}"
      end
    else
      redirect to '/login'
    end
  end

  patch '/testcases/:id' do
    @testcase = current_user.testcases.find(params[:id])
    if logged_in? & @testcase.update(params[:testcase])
      if !params[:feature][:title].empty?
        @testcase.features << Feature.create(params[:feature])
      elsif !params[:feature][:description].empty?
        redirect to "/testcases/#{@testcase.id}/edit"
      end
      redirect to "testcases/#{@testcase.id}"
    else
      redirect to "/testcases/#{@testcase.id}/edit"
    end
  end

  delete '/testcases/:id/delete' do
    testcase = Testcase.find(params[:id])
    if logged_in? & current_user.testcases.include?(testcase)
      testcase.destroy
    end
    redirect to '/testcases'
  end

end
