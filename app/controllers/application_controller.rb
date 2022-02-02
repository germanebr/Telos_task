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

  def require_client_logged_in!
    redirect_to sign_in_client_path, alert: "You must be signed in to do that!" if Current.user.nil?
  end

  def require_seller_logged_in!
    redirect_to sign_in_seller_path, alert: "You must be signed in to do that!" if Current.seller.nil?
  end
end
