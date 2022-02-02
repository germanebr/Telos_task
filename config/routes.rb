Rails.application.routes.draw do
  get "cart", to: "cart#index"

  get "buy", to: "buy#index"

  get "add_book", to: "add_book#index"

  get "seller_profits", to: "seller_profits#index"

  get "books_sold", to: "books_sold#index"

  get "client_password", to: "client_passwords#edit", as: :client_edit_password
  patch "client_password", to: "client_passwords#update"

  get "client_password/reset", to: "client_passwords_resets#new"
  post "client_password/reset", to: "client_passwords_resets#create"
  get "client_password/reset/edit", to: "client_passwords_resets#edit"
  patch "client_password/reset/edit", to: "client_passwords_resets#update"

  get "sign_up_client", to: "client_registrations#new"
  post "sign_up_client", to: "client_registrations#create"
  delete "client_logout", to: "client_sessions#destroy"

  get "sign_in_client", to: "client_sessions#new"
  post "sign_in_client", to: "client_sessions#create"

  get "seller_password", to: "seller_passwords#edit", as: :seller_edit_password
  patch "seller_password", to: "seller_passwords#update"

  get "seller_password/reset", to: "seller_passwords_resets#new"
  post "seller_password/reset", to: "seller_passwords_resets#create"
  get "seller_password/reset/edit", to: "seller_passwords_resets#edit"
  patch "seller_password/reset/edit", to: "seller_passwords_resets#update"

  get "sign_up_seller", to: "seller_registrations#new"
  post "sign_up_seller", to: "seller_registrations#create"
  delete "seller_logout", to: "seller_sessions#destroy"

  get "sign_in_seller", to: "seller_sessions#new"
  post "sign_in_seller", to: "seller_sessions#create"

  root to: "main#index"
end
