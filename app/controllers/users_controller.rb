class UsersController < ApplicationController
    before_action :auth, only: [:show]

  def index
  end

  def new
  end

  def create
      @user = User.new(user_params)

      if (@user.valid?)
          @user.save
          session[:user_id] = @user.id
          redirect_to "/login"

      else
          flash[:errors] = @user.errors.full_messages
          redirect_to '/register'
      end
  end

  def show
      @user = User.find(session[:user_id])
      @secrets = @user.secrets

  end

  def edit
      @user = User.find(session[:user_id])
  end

  def update
      user = User.find(session[:user_id])
      user.update(user_params)

      if (user.save)
          redirect_to "/users/#{user.id}"
      else
          flash[:errors] = user.errors.full_messages
          redirect_to "/users/#{user.id}/edit"
      end
  end

  def destroy
      user = User.find(session[:user_id])
      user.destroy
      session.clear
      redirect_to '/register'
  end

  private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def auth
        return redirect_to "/users/#{current_user.id}" unless current_user.id == params[:id].to_i
    end

end
