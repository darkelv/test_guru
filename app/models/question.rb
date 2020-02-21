class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :check_answers_limit, on: :create

  def check_answers_limit
    errors.add(:answers_limit, 'Максимум 4 ответа') if question.answers.count >= 4
  end
end
