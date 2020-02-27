class QuestionsController < ApplicationController
  before_action :find_test, only: %i[create new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
    question = Question.find(params[:id])
    render locals: { question: question }
  end

  def new; end

  def create
    @test.questions.create(question_params)

    redirect_to test_path(@test.id)
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy

    redirect_to question.test
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Вопрос не найден"
  end
end
