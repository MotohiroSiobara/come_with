Rails.application.routes.draw do
  devise_for :users, :controllers => {
  :sessions => 'users/sessions',
  :registrations => 'users/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  root "events#index"
  resources :events do
    member do
      get :join
    end
  end
end
