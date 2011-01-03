class ApplicationController < ActionController::Base
  protect_from_forgery

  def validate_api_token(token)
    Account.all.last.api_token == token
  end
end
