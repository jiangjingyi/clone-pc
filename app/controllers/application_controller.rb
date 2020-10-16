class ApplicationController < ActionController::Base
    #ログイン後遷移先
    def after_sign_in_path_for(resource)
        pcs_path(resource)
    end
    #サインアップ後遷移先
    def after_sign_up_path_for(resource)
        new_user_session_path(resource)
    end 
    #ログイン後遷移先
    def after_sign_out_path_for(resource)
        new_user_session_path
    end
    
    # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
  
  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  
end
