class ApplicationController < ActionController::Base
  layout :layout_by_resource

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end

  def after_sign_out_path_for(resource_or_scope) 
    if resource_or_scope == :user 
      new_user_session_path
    end
  end

  def after_sign_in_path_for(resource)
    if resource_name == :user 
      interns_root_path
    end
  end
end
