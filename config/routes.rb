Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "questions#index"
  resources :questions
  get 'search' => 'questions#search'

  resources :tags do
    get 'question', to: 'questions#tag_search'
  end
end
