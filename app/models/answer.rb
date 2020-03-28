class Answer < ApplicationRecord
  MAX_ANSWERS = 4

  belongs_to :question
  validates :body, presence: true

  scope :correct, -> { where(correct: true) }

  validate :check_answers_limit, on: :create

  def check_answers_limit
    errors.add(:answers_limit, 'Максимум 4 ответа') if question.answers.count >= MAX_ANSWERS
  end
end
