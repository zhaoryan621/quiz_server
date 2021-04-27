Rails.application.routes.draw do
  # For authenticate user
  devise_for :users

  namespace :api do
    resources :assessment_sessions, only: %i[create] do
      member do
        put :mark_as_score
      end
    end
    resources :assessments, only: %i[index show create] do
      member do
        put :complete
      end
    end
    resources :questions, only: %i[create]
    resources :quizzes, only: %i[index show create]
  end
end
