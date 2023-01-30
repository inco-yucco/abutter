Rails.application.routes.draw do
  root "home#index"

  devise_for :users

  resources :photos do
    # いいねしたり、いいね解除をするurl
    resource :like
    resource :bookmark
    resources :comments
  end

  resources :users do
    resource :follow
    resources :followings
    resources :followers

    # いいね一覧を見るurl
    resources :likes

    resources :bookmarks

    resources :show
  end

  resources :talking_squids
  resources :icons


end
