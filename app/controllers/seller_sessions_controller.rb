class SellerSessionsController < ApplicationController
  def destroy
    session[:seller_id] = nil
    redirect_to root_path, notice: "Logged out"
  end
end
