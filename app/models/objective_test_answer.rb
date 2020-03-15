class ObjectiveTestAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :objective_test


  def self.create_answers(user_id, questions_with_answers)

    questions_with_answers.each do |qna|
      answer = ObjectiveTestAnswer.new
      answer.user_id = user_id

      answer.objective_test_id = qna[0]
      answer.extent  = qna[1].to_i

      answer.save
    end
  end

  def self.calculate_personality(user)
    total = user.objective_test_answers.pluck(:extent).inject(0, :+)

    if total > 0
      "Negative"
    elsif total < 0
      "Positive"
    else
      "Neutral"
    end
  end
end