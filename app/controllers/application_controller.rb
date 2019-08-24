class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!, except: [:top,:about]
   before_action :configure_permitted_parameters, if: :devise_controller?
def after_sign_in_path_for(resource) 
    user_path (current_user.id)
end 
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
     devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
  
  
end
