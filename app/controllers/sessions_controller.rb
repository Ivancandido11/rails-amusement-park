class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    @user = User.find_by(name: params[:user_name])
    return head(:forbidden) unless @user.authenticate(params[:password])

    session[:user_id] = @user.id
    redirect_to @user
  end

  def destroy
    session.delete :user_id
    redirect_to "/"
  end
end
