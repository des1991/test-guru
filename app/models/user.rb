class User < ApplicationRecord
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  devise :database_authenticatable,
        :registerable,
        :recoverable,
        :rememberable,
        :trackable,
        :validatable,
        :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'user_id'
  
  validates :email, format: VALID_EMAIL
  validates :email, uniqueness: { case_sensitive: false }

  before_validation do
    email.downcase.strip
  end

  def tests_by_level(level)
    Test.joins('JOIN tests_users ON tests.id = tests_users.test_id')
        .where(tests_users: { user_id: self.id },level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def full_name
    "#{first_name} #{last_name}" unless first_name.nil? && last_name.nil?
  end
end
