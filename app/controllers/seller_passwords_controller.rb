class SellerPasswordsController < ApplicationController
  before_action :require_seller_logged_in!

  def edit
  end

  def update
      if Current.seller.update(password_params)
        redirect_to root_path, notice: "Password Updated"
      else
        render :edit
      end
  end

  private
  def password_params
    params.require(:seller).permit(:password, :password_confirmation)
  end
end
