class SessionsController < ApplicationController

  before_action :current_user
  def create
    #login user
    user = User.find_by_credentials(session_params[:email], session_params[:password])
    if user
      login!(user)
      redirect_to user_url(current_user)
    else
      flash[:errors] = ["Invalid credentials- please try again, or signup for an account."]
      redirect_to new_session_url
    end
  end

  def destroy
    logout!(current_user)
    redirect_to new_session_url
    #logout user
    #change session token so it's ready for next time
    #delete cookies
  end

  def new
    render :new
  end

  private

  def session_params
    params.require(:users).permit(:email, :password)
  end
end
