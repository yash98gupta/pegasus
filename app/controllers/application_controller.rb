class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource_or_scope)
   if current_user.admin
     admin_dashboard_path
   else
     root_path
   end
  end
  layout :layout

  private

  def layout
    # only turn it off for login pages:
    is_a?(Devise::SessionsController) ? false : "application"
   !devise_controller? && "application"
  end

end
