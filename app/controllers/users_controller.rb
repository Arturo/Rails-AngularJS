class UsersController < ApplicationController

  def confirm
    user = User.find_by_token_and_padding_state(params[:confirmation_token])
    user.confirm! if user
    redirect_to root_path
  end

end
