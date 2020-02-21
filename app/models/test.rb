class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :passed_tests
  has_many :users, through: :passed_tests
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  
  scope :by_category, ->(category_title){ joins(:category).where(categories: { title: category_title })}
  scope :sorted_by_title, -> { order(title: :desc) }
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  validates :title, presence: true,
            uniqueness: { scope: :level}
  validates :level, presence: true,
            numericality: {only_integer: true}

  def self.test_by_category(category_title)
    by_category(category_title).sorted_by_title.pluck(:title)
  end

end
