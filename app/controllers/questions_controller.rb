class QuestionsController < ApplicationController
  before_action :find_test, only: %i[create new]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
    render locals: { question: @question }
  end

  def new; end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to question_path(question)
    else
      redirect_to new_test_question_path(@test)
    end
  end

  def destroy
    @question.destroy

    redirect_to @question.test
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Вопрос не найден"
  end
end
