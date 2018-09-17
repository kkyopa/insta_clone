Rails.application.routes.draw do
  root 'tuita#top'
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
    resources :contacts
    resources :tuita do
      collection do
        post :confirm
      end
    end
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy, :index]
end
