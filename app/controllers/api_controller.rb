class ApiController < ActionController::Base
  before_action :hardcode_json_format

private
  def hardcode_json_format
    request.format = :json
  end
end