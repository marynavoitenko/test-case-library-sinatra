class TestcasesController < ApplicationController

  get '/testcases' do
    if logged_in?
      @testcases = Testcase.all
      erb :'/testcases/index'
    else
      redirect to '/login'
    end
  end

end
