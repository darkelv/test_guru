class TestsController < ApplicationController

  def index
    tests = Test.all
    render locals: { tests: tests }
  end

  def show
    test = Test.find(params[:id])
    render locals: { test: test }
  end
end
