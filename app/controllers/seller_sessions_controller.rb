class SellerSessionsController < ApplicationController
  def new
  end

  def create
    seller = Seller.find_by(email: params[:email])

    if seller.present? && seller.authenticate(params[:password])
      session[:seller_id] = seller.id
      redirect_to root_path, notice: "Logged in succesfully"
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:seller_id] = nil
    redirect_to root_path, notice: "Logged out"
  end
end
