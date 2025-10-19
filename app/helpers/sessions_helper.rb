module SessionsHelper
  # ログインしているか判定
  def logged_in?
    !!current_user
  end

  # 現在のユーザーを返す（必要に応じて追加）
  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id])
  # end
end
