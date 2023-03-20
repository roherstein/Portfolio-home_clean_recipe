class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    # def after_admin_sign_in_path_for(resource)
    #   admin_posts_path
    # end
    
    # def after_admin_sign_out_path_for(resource)
    #   admin_session_path
    # end
    
    def after_sign_in_path_for(resource)
      if resource.class == Admin
        admin_posts_path
      else
        root_path
      end
    end
    
    def after_sign_out_path_for(resource)
      if resource == :admin
        admin_session_path
      else
        root_path
      end
    end
    
    protected
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_in,keys: [:email])
    end
end
