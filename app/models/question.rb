class Question < ApplicationRecord
  belongs_to :test
  belongs_to :passed_test
  has_many :answers, dependent: :destroy

  validates :body, presence: true

end
