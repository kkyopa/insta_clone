Rails.application.routes.draw do
  get 'tuita/top', to: 'tuita#top'
  resources :tuita do
    collection do
  post :confirm
    end
  end
end
