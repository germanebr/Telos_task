class ClientPasswordsController < ApplicationController
  before_action :require_client_logged_in!

  def edit
  end

  def update
      if Current.client.update(password_params)
        redirect_to root_path, notice: "Password Updated"
      else
        render :edit
      end
  end

  private
  def password_params
    params.require(:client).permit(:password, :password_confirmation)
  end
end
