class SellerPasswordsResesController < ApplicationController
  def new
  end

  def create
    @seller = Seller.find_by(email: params[:email])

    if @seller.present?
      PasswordMailer.with(seller: @seller).reset.deliver_later
    end

    redirect_to root_path, notice: "If an account with that email was found, we have sent a link to reset your password."
  end

  def edit
    @seller = Seller.find_signed(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_seller_path, alert: "Your token has expired. Please try again."
  end

  def update
    @seller = Seller.find_signed(params[:token], purpose: "password_reset")

    if @seller.update(password_params)
      redirect_to sign_in_seller_path, notice: "Your password was reset succesfully. Please sign in."
    else
      render :edit
    end
  end

  private
  def password_params
    params.require(:seller).permit(:password, :password_confirmation)
  end
end
