class UsersController < ApplicationController

  def confirm
    resource.confirm
    redirect_to root_path
  end

  private

  def resource
    @user ||= User.pending.find_by!(confirmation_token: params[:confirmation_token])
  end
end
