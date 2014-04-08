class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

#Remember to assign strong params to controllers, so to whitelsit all incoming values, and protect the app from injections through mass assignement.
protect_from_forgery with: :null_session
end
