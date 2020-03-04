module QuestionsHelper
  def question_header_by(question)
    question_title = question.test.title
    if question.new_record?
      "Создать вопрос #{question_title}"
    else
      "Редактировать вопрос #{question_title}"
    end
  end
end
