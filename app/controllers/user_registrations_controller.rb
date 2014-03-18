class UserRegistrationsController < ApplicationController
  inherit_resources

  def create
    create!(:notice => "Dude! Nice job") { root_url }
  end

end
