module PassedTestsHelper

  def show_current_question_num_of_total
    "Вопрос № #{@current_test_passage.question_number} из  #{@current_test_passage.questions_count}"
  end

  def test_result
    if @current_test_passage.completed?
      if @current_test_passage.rate_percentage >= PassedTest::TEST_SUCCESS_RATE
        simple_format("Вы успешно прошли тест", {style: 'color: green'}, wrapper_tag: "h2")
      else
        simple_format("Вы провалили тест", {style: 'color: red'}, wrapper_tag: "h2")
      end
    end
  end
end
