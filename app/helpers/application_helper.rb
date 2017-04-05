module ApplicationHelper
  def logado
  	session[:user]
  end
end
