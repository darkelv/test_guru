class BadgeService
  attr_accessor :test_passage, :user, :test, :badges

  def initialize test_passage
    self.test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @badges = Badge.all
  end

  def set_badges
    user.badges << badges.select { |badge| send("#{badge.condition}_award?") }
  end

  private

  def passed_on_first_try_award?  
    user.test_ids.count(test_passage.test_id) == 1
  end

  def all_in_category_award?
    user.passed_tests.by_category(test.category).pluck(:test_id).uniq.count == Test.by_category(test.category.title).count
  end

  def all_in_level_award?
    user.passed_tests.by_level(test.level).pluck(:test_id).uniq.count == Test.by_level(test.level).count
  end
end
