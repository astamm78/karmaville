Karmaville::Application.routes.draw do
  resources :users, :only => [:index]

  root :to => 'users#index'

  get 'page/:id' => 'users#page', :as => :page

end
