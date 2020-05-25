class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    # ログイン後のリダイレクト先変更
    def after_sign_in_path_for(resource)
      "/user/#{current_user.id}"
    end
    protected

    # 入力フォームからアカウント名情報をDBに保存するために追加
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
    protect_from_forgery
end
