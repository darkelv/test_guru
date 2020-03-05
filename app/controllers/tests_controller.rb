class TestsController < ApplicationController
  before_action :set_test, only: %i[show start result]
  before_action :set_user, only: :start

  def index
    tests = Test.all
    render locals: { tests: tests }
  end

  def show
    render locals: { test: @test }
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.last
  end
end
