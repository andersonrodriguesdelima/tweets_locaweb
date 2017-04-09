Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'most_relevants' => 'twitter#most_relevants'
  get 'most_mentions' => 'twitter#most_mentions'
  get 'most_relevants_html' => 'twitter#most_relevants_html'
  get 'most_mentions_html' => 'twitter#most_mentions_html'
  get 'home' => 'home#index'
end
