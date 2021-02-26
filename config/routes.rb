Rails.application.routes.draw do
  root to: "pages#home", via: :all
  match "*path", to: "pages#home", via: :all
end
