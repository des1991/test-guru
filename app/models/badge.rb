class Badge < ApplicationRecord
  has_and_belongs_to_many :users
  has_one :rule, class_name: 'BadgeRule', dependent: :destroy

  validates :title, presence: true
  validates :image, presence: true

  def self.reward(test_passage)
    user = test_passage.user

    all.each do |badge|
      if badge.rule.passed?(test_passage)
        user.badges << badge
      end
    end
  end
end
