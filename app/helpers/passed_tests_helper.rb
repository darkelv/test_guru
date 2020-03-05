module PassedTestsHelper

  def show_current_question_num_of_total
    "Вопрос № #{@current_test_passage.question_number} из  #{@current_test_passage.questions_count}"
  end
end
