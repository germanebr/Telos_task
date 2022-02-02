class SellerRegistrationsController < ApplicationController
  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(seller_params)

    if @seller.save
      redirect_to root_path, notice: "Succesfully created a seller."
    else
      render :new
    end
  end

  private
  def seller_params
    params.require(:seller).permit(:name, :phone, :email, :password, :password_confirmation)
    params[:earnings] = 0
  end
end
