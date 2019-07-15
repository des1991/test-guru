class Category < ApplicationRecord
  has_many :tests
  has_many :test_passages, through: :tests

  default_scope { order(title: :asc) }

  validates :title, presence: true
  validates :title, uniqueness: true

  private

  def self.list
    all.pluck(:title, :id)
  end
end
