module PassedTestsHelper

  def show_current_question_num_of_total
    I18n.t('.question_num_of_total_html', question_number: @current_test_passage.question_number, total: @current_test_passage.questions_count)
  end

  def test_result
    if @current_test_passage.completed?
      if @current_test_passage.rate_percentage >= PassedTest::TEST_SUCCESS_RATE
        simple_format("#{I18n.t('passed_tests.result_message.passed_test_message')}", {}, wrapper_tag: "h1")
        simple_format("#{t('passed_tests.result.score_message', scores: @current_test_passage.rate_percentage)}", {style: 'color: green'}, wrapper_tag: "h2")
      else
        simple_format("#{I18n.t('passed_tests.result_message.failed_test_message')}", {}, wrapper_tag: "h1")
        simple_format("#{t('passed_tests.result.score_message', scores: @current_test_passage.rate_percentage)}", {style: 'color: red'}, wrapper_tag: "h2")
      end
    end
  end

  def get_progress_percentage
    ((@current_test_passage.question_number / @current_test_passage.questions_count.to_f) * 100).to_i
  end
end
