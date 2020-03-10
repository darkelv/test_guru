class TestsController < ApplicationController
  before_action :set_test, only: %i[show start result]

  def index
    tests = Test.all
    render locals: { tests: tests }
  end

  def show
    render locals: { test: @test }
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
