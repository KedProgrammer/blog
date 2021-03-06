class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Has iniciado Sesión correctamente"
      log_in(user)
      redirect_to root_path

    else
      flash.now[:danger] = "Email invalido /Contraseña inválida "
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end


end
