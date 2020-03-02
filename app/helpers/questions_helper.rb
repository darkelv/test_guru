module QuestionsHelper

  def current_year
    Time.current.year
  end

  def github_url(title, repo_url)
    link_to(title, repo_url, target: "_blank")
  end

  def question_header_by(question)
    if question.present?
      question_title = question.test.title

      if question.new_record?
        title = "Создать вопрос #{question_title}"
      else
        title = "Редактировать вопрос #{question_title}"
      end
      render inline: title
    end
  end
end
