class Badge < ApplicationRecord
  has_and_belongs_to_many :users
  has_one :rule, class_name: 'BadgeRule', dependent: :destroy

  validates :title, presence: true
  validates :image, presence: true
end
