class UsersController < ApplicationController

  before_action :current_user

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      login!(user)
      current_user
      redirect_to user_url(user)
    else
      flash[:errors] = ["You aint even gotta tell em - just fix the following errors:"]
      flash[:errors] += user.errors.full_messages
      redirect_to new_user_url
    end
  end

  private

  def user_params
    params.require(:users).permit(:email, :password)
  end

  def show
    render :show
  end

end
