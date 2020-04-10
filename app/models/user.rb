class User < ApplicationRecord
  VALID_EMAIL_FORMAT = /.+@.+\..+/i

  ROLES = {
    user: 0,
    admin: 1
  }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :passed_tests
  has_many :tests, through: :passed_tests
  has_many :author_tests, class_name: "Test"
  has_many :gists
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: VALID_EMAIL_FORMAT, message: "Неверный формат почта" }

  enum role: ROLES

  def test_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    self.passed_tests.order(id: :desc).find_by(test_id: test.id)
  end
end
