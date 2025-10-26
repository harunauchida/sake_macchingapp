class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "ログインしました！"
        else
            flash.now[:alert] = "メールまたはパスワードが違います"
            render :new
        end
    end

    def destroy
        session.delete(:user_id)   # ログアウト処理
        redirect_to root_path, notice: "ログアウトしました"
    end

    def guest_login
        user = User.find_or_create_by(email: "guest@example.com") do |u|
        u.name = "ゲストユーザー"
        u.password = SecureRandom.urlsafe_base64
    end
    session[:user_id] = user.id
    redirect_to root_path, notice: "ゲストログインしました"
    end
end
