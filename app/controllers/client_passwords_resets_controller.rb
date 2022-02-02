class ClientPasswordsResesController < ApplicationController
  def new
  end

  def create
    @client = Client.find_by(email: params[:email])

    if @client.present?
      PasswordMailer.with(client: @client).reset.deliver_later
    end

    redirect_to root_path, notice: "If an account with that email was found, we have sent a link to reset your password."
  end

  def edit
    @client = Client.find_signed(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_client_path, alert: "Your token has expired. Please try again."
  end

  def update
    @client = Client.find_signed(params[:token], purpose: "password_reset")

    if @client.update(password_params)
      redirect_to sign_in_client_path, notice: "Your password was reset succesfully. Please sign in."
    else
      render :edit
    end
  end

  private
  def password_params
    params.require(:client).permit(:password, :password_confirmation)
  end
end
