Rails.application.routes.draw do
  get "cart", to: "cart#index"

  get "buy", to: "buy#index"

  get "add_book", to: "add_book#index"

  get "seller_profits", to: "seller_profits#index"

  get "books_sold", to: "books_sold#index"

  root to: "main#index"
end
