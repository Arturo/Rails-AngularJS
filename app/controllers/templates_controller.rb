class TemplatesController < ApplicationController
  def show
    render layout: false, template: "templates/#{params[:page]}"
  end
end
