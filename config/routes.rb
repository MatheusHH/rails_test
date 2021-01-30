Rails.application.routes.draw do
  devise_for :users, path: 'interns/users'

  namespace :interns do
    get 'schedules/index'
    root 'schedules#index'

    resources :schedules, except: [:show]
  end
end
