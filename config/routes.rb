Codetry::Application.routes.draw do
  get "sitemap.xml" => "sitemap#index", as: "sitemap", defaults: { format: "xml" }

  get "admin/index", :id => "admin"
  match "admin" => "admin#index"

  get "contributors/index", :id => "contributors"
  match "contributors" => "contributors#index"

  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post

  get "usage_policy/index", :id => "usage_policy"
  match "usage_policy" => "usage_policy#index"

  get "press/index", :id => "press"
  match "press" => "press#index"

  get "faq/index", :id => "faq"
  match "faq" => "faq#index"

  get "privacy_policy/index", :id => "privacy_policy"
  match "privacy_policy" => "privacy_policy#index"

  get "poems_wall/index", :id => "poems_wall"
  match "poems_wall" => "poems_wall#index"

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  resources :users do
    resources :poems do
      resources :comments 
      member do
        post :upvote
        post :downvote
      end
    end
  end

  

  resources :users do
    member do
      put :banunban
    end
  end


end
