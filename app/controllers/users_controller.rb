class UsersController < ApplicationController 
  before_action :require_login, except: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update]

  # 新規登録フォーム
  def new
    @user = User.new
  end

  # 新規登録処理
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "登録が完了しました！"
      redirect_to root_path
    else
      flash.now[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  # ユーザー詳細
  def show
    # @user は set_user で取得
  end

  # 編集フォーム
  def edit
    # @user は set_user で取得
    redirect_to root_path, alert: "他ユーザーの編集はできません" unless @user == current_user
  end

  # 更新処理
  def update
    redirect_to root_path, alert: "他ユーザーの編集はできません" and return unless @user == current_user

    # パスワード空欄の場合は削除して更新
    update_params = user_params
    if update_params[:password].blank?
      update_params.delete(:password)
      update_params.delete(:password_confirmation)
    end

    if @user.update(update_params)
      flash[:success] = "アカウント情報を更新しました！"
      redirect_to @user
    else
      flash.now[:error] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio, :icon)
  end

  # ログインしていない場合はリダイレクト
  def require_login
    redirect_to login_path unless session[:user_id]
  end

  # current_user helper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user
end
