class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate
     redirect_to '/auth/twitter'
  end

end