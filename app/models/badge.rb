class Badge < ApplicationRecord
  CONDITIONS = {
    all_in_category: 0,
    passed_on_first_try: 1,
    all_in_level: 3
  }

  validates :title, :condition, :image, presence: true
  validates :title, uniqueness: true

  before_validation :set_image

  has_many :user_badges, dependent: :destroy

  enum condition: CONDITIONS

  private

  def set_image
    self.image ||= "#{self.condition}.jpg"
  end
end
