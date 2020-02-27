class User < ApplicationRecord
  has_many :passed_tests
  has_many :tests, through: :passed_tests
  has_many :author_tests, class_name: "Test"

  validates :name, presence: true
  validates :email, presence: true,
            uniqueness: true,
            format: { with: /.+@.+\..+/i }

  def test_by_level(level)
    tests.where(level: level)
  end
end
