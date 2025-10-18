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
        session.delete(:user_id)
        redirect_to root_path, notice: "ログアウトしました"
    end

    def guest_login
        guest = User.create!(name: "ゲスト", email: "guest@example.com", password: "password")
        session[:user_id] = guest.id
        redirect_to root_path, notice: "ゲストとしてログインしました！"
    end
end
