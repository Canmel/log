Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  devise_for :users,controllers:{sessions:"users/sessions",confirmations:"users/confirmations",passwords:"users/passwords",registrations:"users/registrations" }, path: "auth",
             path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  resources :home

  resources :users
end
