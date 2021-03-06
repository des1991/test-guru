class Test < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  scope :easy_level, -> { where(level: 0..1) }
  scope :normal_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, ->(title) { 
    joins(:category).where(categories: { title: title }) }
  scope :by_level, -> (level) { where(level: level) }

  validates :title, presence: true, uniqueness: { case_sensitive: false,
                                                  scope: :level }
  validates :level, numericality: { only_integer: true, 
                                    greater_than_or_equal_to: 0 }
  validates :timer, numericality: { only_integer: true, 
                                    greater_than_or_equal_to: 0 }

  def self.titles_by_category(title)
    by_category(title).pluck(:title)
  end

  def active?
    questions.active.any?
  end

  def timer_in_seconds
    timer.zero? ? 0 : (timer * 60)
  end

  private

  def self.levels
    all.pluck(:level).uniq.sort
  end
end
