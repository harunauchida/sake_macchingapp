class ApplicationController < ActionController::Base
  helper SakesHelper
  helper_method :current_user, :logged_in?

  # 現在ログインしているユーザーを返す
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # ログインしているか判定
  def logged_in?
    !!current_user
  end

  # ログイン必須の処理
  def require_login
    unless logged_in?
      flash[:alert] = "ログインしてください"
      redirect_to login_path
    end
  end
end
