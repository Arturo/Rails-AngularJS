class Api::BaseController < InheritedResources::Base
  respond_to :json
  skip_before_filter :verify_authenticity_token
end
