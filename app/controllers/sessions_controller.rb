class SessionsController < ApplicationController

  def new
    @user = User.find_by(name: session[:name])
  end

  def create
    @user = User.find_by(name: params[:username])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
    render 'home'
  end

  def home

  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end