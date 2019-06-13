class Answer < ApplicationRecord
  MAXIMUM_ANSWERS = 4

  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_count

  private

  def validate_count
    if question && question.answers.size >= MAXIMUM_ANSWERS
      errors.add(:count, "Maximum answers: #{MAXIMUM_ANSWERS}")
    end
  end
end
