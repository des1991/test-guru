class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins('JOIN tests_users ON tests.id = tests_users.test_id')
        .where(tests_users: { user_id: self.id },level: level)
  end
end
