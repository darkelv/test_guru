class TestsController < ApplicationController
  before_action :set_test, only: %i[show]

  def index
    tests = Test.all
    render locals: { tests: tests }
  end

  def show
    render locals: { test: @test }
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
