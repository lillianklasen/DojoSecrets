class SessionsController < ApplicationController
  def new
  end

  def create
      @user = User.find_by_email(params[:email])

      if @user.try(:authenticate, params[:password])
          session[:user_id] = @user.id

          redirect_to "/users/#{@user.id}"
      else
          flash[:errors] = ["Invalid Combination"]
          redirect_to :back
      end
  end

  def destroy
      session.clear
      redirect_to '/login'
  end


end
