Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/:page" => "pages#show"
  # get "/pages/*page" => "pages#show" to wants us to put these at /pages/features/one, /pages/features/two
  root "pages#show", page: "home"
end
