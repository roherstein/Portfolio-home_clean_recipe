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
  
  scope module: :public do
    root to: 'homes#top'
    get 'categories' => 'categories#index'
    get 'categories/search' => 'categories#search'
    get 'users/mypage' => 'users#mypage'
    get 'users/confirm' => 'users#confirm'
    get 'users/withdrawal' => 'users#withdrawal'
    get 'posts/draft' => 'posts#draft'
    resources :users, only:[:show,:edit,:update]
    resources :posts do
      resources :comments, only:[:index,:create,:destroy]
    end
    resource :likes, only:[:index,:create,:destroy]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
