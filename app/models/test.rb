class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :passed_tests
  has_many :users, through: :passed_tests
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  
  scope :by_category, ->(category_title){ joins(:category).where(categories: { title: category_title })}

  def self.test_by_category(category_title)
    Test.by_category(category_title).order("tests.title desc").pluck("tests.title")
  end

end
