module QuestionsHelper
  def question_header(question)
    if question.new_record?
      action = 'Create new'
      title = @test.title
    else
      action = 'Edit'
      title = question.test.title
    end

    "#{action} <#{title}> question"
  end
end
