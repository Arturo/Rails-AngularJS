class RegistrationsController < ApplicationController

  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(params[:registration])
    if @registration.save
      redirect_to root_path
    else
      render 'new'
    end
  end

end
