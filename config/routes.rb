Rails.application.routes.draw do
  root 'tuita#top'
 
  resources :tuita do
    collection do
  post :confirm
    end
  end
end
