Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: "objective_test_answers#index"

  resources :objective_test_answers do
    collection do
      get :answer_form
      post :answer_submission
    end
  end

  resources :invitations
  resources :objective_tests
end
