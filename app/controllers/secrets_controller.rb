class SecretsController < ApplicationController
  def index
      @secrets = Secret.all
  end

  def create
      user = User.find(session[:user_id])
      secret = Secret.new(secret_params)
      secret.user = user

      if (secret.valid?)
          secret.save
          session[:secret_id] = secret.id
          redirect_to "/users/#{user.id}"
      else
          flash[:errors] = secret.errors.full_messages
          redirect_to "/users/#{user.id}"
      end
  end

  def destroy
      user = User.find(session[:user_id])
      secret = Secret.find(params[:id])
      secret.destroy
      return redirect_to :back
  end

  private
    def secret_params
        params.require(:secret).permit(:content)
    end
end
