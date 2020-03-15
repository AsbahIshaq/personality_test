class PictureTestAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :picture_test

  def self.create_answers(user_id, questions_with_answers)
    questions_with_answers.each do |qna|
      answer = PictureTestAnswer.new
      answer.user_id = user_id

      answer.picture_test_id = qna[0]
      answer.extent  = qna[1].to_i

      answer.save
    end
  end

  def self.calculate_personality(user)
    total = user.picture_test_answers.pluck(:extent).inject(0, :+)
    (total * 100) / 25
  end
end
