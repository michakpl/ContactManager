class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def find_resource
  	if(params[:contact_id].blank?)
	  	class_name = params[:controller].singularize
	  	klass = class_name.camelize.constantize
  		self.instance_variable_set "@" + class_name, klass.find(params[:id])
  	else
	  	class_name = params[:contact_type].underscore
	  	klass = class_name.camelize.constantize
  		self.instance_variable_set "@contact", klass.find(params[:contact_id])
    end
  end

  def current_user
    if(session[:user_id].blank?)
      false
    else
      @current_user ||= User.find(session[:user_id])
    end
  end
end
