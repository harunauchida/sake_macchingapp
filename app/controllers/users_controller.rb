class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "登録が完了しました！"
        else
            render :new
        end
    end

    def show; 
      @user = User.find(params[:id])
    end

    def edit; 
      @user = User.find(params[:id])
    end

    def update
        if @user.update(user_params)
            redirect_to @user, notice: "プロフィールを更新しました！"
        else
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

    def require_login
        redirect_to login_path unless session[:user_id]
    end
end
