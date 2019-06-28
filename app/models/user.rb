require 'digest/sha1'

class User < ApplicationRecord
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'user_id'

  validates :name, presence: true
  validates :login, presence: true
  validates :email, format: VALID_EMAIL
  validates :email, uniqueness: { case_sensitive: false }

  before_validation do
    email.downcase!.strip!
  end

  has_secure_password

  def tests_by_level(level)
    Test.joins('JOIN tests_users ON tests.id = tests_users.test_id')
        .where(tests_users: { user_id: self.id },level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
