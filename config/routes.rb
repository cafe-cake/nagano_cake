Rails.application.routes.draw do
  root to: "public/homes#top"
  get "about" =>"public/homes#about"

  devise_for :members,skip: [:passwords,], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  scope module: :public do
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete :destroy_all
      end
    end
    resources :orders, only: [:index, :show, :new, :create] do
      collection do
        post :confirm
        get :order_fix
      end
    end
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :members, only: [:show, :edit, :update] do
      collection do
        get :unsubscribe
        patch :withdraw
      end
    end
  end

  namespace :admin do
    root to: "homes#top"
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:show, :update] do
      resources :item_orders, only: [:update]
    end
    resources :genres, only: [:index, :create, :edit, :update]
    resources :members, only: [:index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
