class TestsController < ApplicationController
  before_action :set_test, only: %i[start]

  def index
    @tests = Test.all
    render locals: { tests: @tests }, notice: t('.success')
  end

  def start
    if @test.questions.any?
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test), notice: t('.success')
    else
      redirect_to root_path, flash: {error: I18n.t('tests.index.test_not_complete')}
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
