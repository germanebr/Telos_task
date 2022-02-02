class MainController < ApplicationController
  def index
    if session[:client_id]
      @client = Client.find_by(id: session[:client_id])
    elsif session[:seller_id]
      @seller = Seller.find_by(id: session[:seller_id])      
    end
  end
end
