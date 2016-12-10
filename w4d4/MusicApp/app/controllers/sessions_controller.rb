class SessionsController < ApplicationController



  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])

    if @user
      login_user(@user)
      flash[:messages] = ["welcome back"]
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["invalid email or password"]
      render :new
    end

  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil

    redirect_to new_session_url
  end

  def new
    render :new
  end



end
