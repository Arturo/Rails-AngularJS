class Api::EventsController < Api::BaseController
  protected
  def permitted_params
    params.permit( event: [:title, :start_date, :end_date] )
  end
end
