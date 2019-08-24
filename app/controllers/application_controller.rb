class ApplicationController < ActionController::Base
  
  #before_action :authenticate_user!, except: [:top,:about]
   before_action :configure_permitted_parameters, if: :devise_controller?
def after_sign_in_path_for(resource) 
    user_path (current_user.id)
end 
  # def after_sign_out_path_for(resource)
  #     root_path
  # end
  
  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
     devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
  def correct_user?(user)
      if current_user.nil?
        return false
      else
        user.id.equal?(current_user.id)
      end
  end 
  
  
   
end
