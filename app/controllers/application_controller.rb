class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    invitations_path
  end

  def after_sign_out_path_for(resource)
    objective_test_answers_path
  end
end
