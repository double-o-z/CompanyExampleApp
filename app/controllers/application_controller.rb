class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
protect_from_forgery with: :exception
require 'rest_client'

#Remember to assign strong params to controllers, so to whitelsit all incoming values, and protect the app from injections through mass assignement.

end
