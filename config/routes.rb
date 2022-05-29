Rails.application.routes.draw do

 devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


devise_scope :user do
  get 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
end


root to: 'public/homes#top'
get 'public/about' => 'public/homes#about'


get "search" => "searches#search"

namespace :admin do
 resources :customers #管理者
end

namespace :public do
 resources :users do #顧客
   member do
    get :filmfavorites
   end
 end

 resources :movies do #映画情報
  resource :favorites, only: [:create, :destroy]
 end

 resources :films do #映画感想
  resource :filmfavorites, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
 end

#退会機能
get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
end

end



# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


