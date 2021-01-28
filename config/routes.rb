Rails.application.routes.draw do
  devise_for :users, path: 'interns/users'

  namespace :interns do
    get 'home/index'
    root 'home#index'

    resources :schedules, except: [:show]
  end
end
