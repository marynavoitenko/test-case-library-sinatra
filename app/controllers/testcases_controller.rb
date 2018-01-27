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

end
