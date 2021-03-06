class TestPassage < ApplicationRecord
  MINIMUM_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  has_one :category, through: :test

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def completed?
    current_question.nil?
  end

  def correct_percent
    correct_questions.to_f * 100 / test.questions.count
  end

  def passed?
    correct_percent >= MINIMUM_PERCENT
  end

  def question_number
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  def time_left
    time = created_at + test.timer_in_seconds - Time.current
    time >= 0 ? time : 0
  end

  def timer?
    test.timer > 0
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
