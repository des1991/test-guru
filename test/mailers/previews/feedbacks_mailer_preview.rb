# Preview all emails at http://localhost:3000/rails/mailers/feedbacks_mailer
class FeedbacksMailerPreview < ActionMailer::Preview
  def send_feedback
    feedback = Feedback.new(user: User.first, message: 'Test message from user.')

    FeedbacksMailer.send_feedback(feedback)
  end
end
