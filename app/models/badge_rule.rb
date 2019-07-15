class BadgeRule < ApplicationRecord
  RULE_TYPES = %w[category first_try level]

  belongs_to :badge

  validates :rule_type, presence: true
  validates :rule_value, presence: true

  def passed?(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    test_passage.passed? ? send("#{rule_type}_rule") : false
  end

  private

  def category_rule
    category = Category.find(rule_value)

    category.test_passages.where(user: @user)
                            .select(&:passed?)
                            .pluck(:test_id).uniq.sort == category.test_ids
  end

  def first_try_rule
    @user.test_passages.where(test: @test).count == 1
  end

  def level_rule
    tests = Test.by_level(rule_value)

    @user.test_passages.where(test: tests)
                        .select(&:passed?)
                        .pluck(:test_id).uniq.sort == tests.ids
  end
end
