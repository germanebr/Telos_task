Rails.application.routes.draw do
  get "cart", to: "cart#index"

  get "buy", to: "buy#index"

  get "add_book", to: "add_book#index"

  get "seller_profits", to: "seller_profits#index"

  get "books_sold", to: "books_sold#index"

  get "sign_up_client", to: "client_registrations#new"
  post "sign_up_client", to: "client_registrations#create"
  delete "client_logout", to: "client_sessions#destroy"

  get "sign_up_seller", to: "seller_registrations#new"
  post "sign_up_seller", to: "seller_registrations#create"
  delete "seller_logout", to: "seller_sessions#destroy"

  root to: "main#index"
end
