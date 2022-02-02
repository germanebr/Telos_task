class ApplicationController < ActionController::Base
  before_action :set_current_client
  before_action :set_current_seller

  def set_current_client
    if session[:client_id]
      Current.client = Client.find_by(id: session[:client_id])
    end
  end

  def set_current_seller
    if session[:seller_id]
      Current.seller = Seller.find_by(id: session[:seller_id])
    end
  end
end
