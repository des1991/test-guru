class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins('JOIN tests_users ON tests.id = tests_users.test_id 
      JOIN users ON users.id = tests_users.user_id')
      .where(tests: { level: level })
  end
end
