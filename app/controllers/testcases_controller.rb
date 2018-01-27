class TestcasesController < ApplicationController

  get '/testcases' do
    if logged_in?
      @testcases = Testcase.all
      erb :'/testcases/index'
    else
      redirect to '/login'
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
      @testcase = current_user.testcases.find(params[:id])
      erb :'testcases/edit'
    else
      redirect to '/login'
    end
  end

  patch '/testcases/:id' do
    @testcase = current_user.testcases.find(params[:id])
    if logged_in? & @testcase.update(params[:testcase])
      if !params[:feature][:title].empty?
        @testcase.features << Feature.create(params[:feature])
      end
      redirect to "testcases/#{@testcase.id}"
    else
      erb :error
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
