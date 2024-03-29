Rails.application.routes.draw do
  
  devise_for :users,controllers:{
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
  
  devise_scope :user do
    post 'public/guest_sign_in', to: 'public/sessions#new_guest'
  end
  
  devise_for :admins,skip:[:registration,:password],controllers:{
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    get 'users/:id/history' => 'users#history'
    get 'comments/:id/list' => 'comments#list'
    resources :users, only:[:index,:show,:edit,:update]
    resources :posts, only:[:index,:show]
    resources :comments, only:[:index,:show,:destroy]
  end
  
  scope module: :public do
    root to: 'homes#top'
    get 'categories' => 'categories#index'
    get 'users/mypage' => 'users#mypage'
    get 'users/confirm' => 'users#confirm'
    get 'users/withdrawal' => 'users#withdrawal'
    get 'posts/draft' => 'posts#draft'
    get 'search' => 'searches#search'
    
    resources :users, only:[:show,:edit,:update] do
      member do
        get :post_list
      end
    end
    resources :posts do
      resources :comments, only:[:create,:destroy]
      collection do
        get :my_comments
      end
      resource :likes, only:[:create,:destroy]
      collection do
        get :my_likes
      end
    end
    
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
