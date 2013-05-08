Codetry::Application.routes.draw do
  
  get "privacy/index", :id => "privacy_policy"
 match "privacy_policy" => "privacy_policy#index"

 get "faq/index", :id => "faq"
 match "faq" => "faq#index"

 get "press/index", :id => "press"
 match "press" => "press#index"

 get "contributors/index", :id => "contributors"
 match "contributors" => "contributors#index"

 get "usage_policy/index", :id => "usage_policy"
 match "usage_policy" => "usage_policy#index"

match 'contact' => 'contact#new', :as => 'contact', :via => :get
match 'contact' => 'contact#create', :as => 'contact', :via => :post

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users do
    resources :poems
  end
end
