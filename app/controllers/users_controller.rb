class UsersController < ApplicationController

  def confirm
    user = User.where(confirmation_token: params[:confirmation_token])
    if (!params[:confirmation_token].blank?) && user && user.pending?
      user.confirmed
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

end
