Rails.application.routes.draw do
  root to: "public/homes#top"
  get "about" =>"public/homes#about"
  
  devise_for :members,skip: [:passwords,], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    root to: "homes#top"
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
