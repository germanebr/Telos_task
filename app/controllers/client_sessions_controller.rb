class ClientSessionsController < ApplicationController
  def new
  end

  def create
    client = Client.find_by(email: params[:email])

    if client.present? && client.authenticate(params[:password])
      session[:client_id] = client.id
      redirect_to root_path, notice: "Logged in succesfully"
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:client_id] = nil
    redirect_to root_path, notice: "Logged out"
  end
end
