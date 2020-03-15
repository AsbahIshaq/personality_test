class ObjectiveTestAnswersController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def answer_submission
    if params[:email_address].present?
      @user = User.find_by(email: params[:email_address])

      if !@user
        @user = User.create(email: params[:email_address], user_name: params[:user_name], password: "123456")
      else
        @user.objective_test_answers.delete_all
      end
      ObjectiveTestAnswer.create_answers(@user.id, params[:questions])

      @result = ObjectiveTestAnswer.calculate_personality(@user.reload)
    end

    respond_to do |format|
      format.html
    end
  end
end