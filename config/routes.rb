Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope  :user do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :users, only: %i[show], controller: 'users/users'

  resources :books, only: %i[index show] do
    resources :upvotes, only: %i[create destroy], shallow: true
  end

  resources :borrow_lists, only: %i[create]

  namespace :admin do
    resources :registrations
    resources :csv, only: %i[create]
    resources :books, only: %i[update destroy]
    get 'book_collection_list/edit', to: 'books#edit'
    get 'fetch_books', to: 'fetch_books#search'
  end

  get 'book_collection_list', to: 'pages#book_collection_list'
  delete 'borrow_list/delete', to: 'borrow_lists#destroy'

  root to: 'pages#book_collection_list'
end
