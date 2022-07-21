class ApplicationController < ActionController::Base
  # ログイン済ユーザーのみにアクセスを許可
  before_action :authenticate_user!, except: [:index]

  # deviseコントローラーにストロングパラメータを追加
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # 新規登録(sign_up)時にnameキーのパラメーターを追加で許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加で許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end
end
