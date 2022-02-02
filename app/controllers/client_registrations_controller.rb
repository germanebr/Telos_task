class ClientRegistrationsController < ApplicationController
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to root_path, notice: "Succesfully created a client."
    else
      render :new
    end
  end

  private
  def client_params
    params.require(:client).permit(:name, :email, :address, :password, :password_confirmation)
    params[:funds] = 50
  end
end
