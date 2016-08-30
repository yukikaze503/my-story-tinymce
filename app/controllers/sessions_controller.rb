class SessionsController < ApplicationController

  def create
    user = User.find_by(nickname: params[:nickname])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to stories_path
    else
      flash[:error] = "用户名与密码不匹配"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

end
