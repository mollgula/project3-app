Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'fun/index', to: 'fun#index'
  get 'fun/result', to: 'fun#result'
  get 'fun/list', to: 'fun#list'
  post 'fun/search', to: 'fun#search'
  get 'fun/storage', to: 'fun#storage'
end
