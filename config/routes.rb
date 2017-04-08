Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'most_relevants' => 'twitter#most_relevants'
  get 'most_mentions' => 'twitter#most_mentions'
  get 'home' => 'home#index'
end
