Rails.application.routes.draw do
  resources :character_types do
    resources :character_attributes
  end
  root to: "home#index", as: "home"

  get "my_characters" => "character_types#my_characters", as: :my_characters

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
