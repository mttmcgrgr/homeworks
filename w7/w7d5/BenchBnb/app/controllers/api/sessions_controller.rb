class Api::SessionsController < ApplicationController


  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:username])

  end



  def destroy

  end



end
