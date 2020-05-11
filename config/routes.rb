Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'plays#home'
  
  get 'plays/home'
  post 'store_images', to: 'plays#store_images'
end
