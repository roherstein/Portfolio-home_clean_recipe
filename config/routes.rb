Rails.application.routes.draw do
  
  devise_for :users,controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_scope :user do
    post 'public/guest_sign_in', to: 'public/sessions#new_guest'
  end
  
  devise_for :admins,skip:[:registration,:password],controllers:{
    sessions: 'admin/sessions'
  }
  
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
