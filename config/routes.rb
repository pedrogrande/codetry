Codetry::Application.routes.draw do
#<<<<<<< HEAD
  
  

#=======

  get "contributors/index", :id => "contributors"
  match "contributors" => "contributors#index"

  get "contact/index", :id => "contact"
  match "contact" => "contact#index"

  get "usage_policy/index", :id => "usage_policy"
  match "usage_policy" => "usage_policy#index"

  get "press/index", :id => "press"
  match "press" => "press#index"

  get "faq/index", :id => "faq"
  match "faq" => "faq#index"

  get "privacy_policy/index", :id => "privacy_policy"
  match "privacy_policy" => "privacy_policy#index"
#>>>>>>> upstream/master

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"
  devise_for :users
  resources :users do
    resources :poems do
    	resources :comments 
    end
  end
end