class User < ApplicationRecord
  VALID_EMAIL_FORMAT = /.+@.+\..+/i

  has_many :passed_tests
  has_many :tests, through: :passed_tests
  has_many :author_tests, class_name: "Test"

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: VALID_EMAIL_FORMAT, message: "Неверный формат почта" }

  has_secure_password

  def test_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    self.passed_tests.order(id: :desc).find_by(test_id: test.id)
  end
end
