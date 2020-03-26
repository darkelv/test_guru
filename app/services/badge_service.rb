class BadgeService
  attr_accessor :test_passage, :user, :test, :badges

  def initialize test_passage
    self.test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @badges = Badge.all
  end

  def check_badges
    return [] unless test_passage.completed?

    badges.select { |badge| send(badge.condition) }
  end

  private

  def passed_on_first_try
    user.test_ids.count(test_passage.test_id) == 1
  end

  def all_in_category
    user.passed_tests.by_category(test.category).count == Test.by_category(test.category.title).count
  end

  def all_in_level
    user.passed_tests.by_level(test.level).count == Test.by_level(test.level).count
  end
end
