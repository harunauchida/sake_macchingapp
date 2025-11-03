class ContactsController < ApplicationController
# 新規問い合わせフォーム
    def new
        @contact = Contact.new
    end

# 送信処理
    def create
        @contact = Contact.new(contact_params)
        if @contact.save
# 成功時はトップページにリダイレクト
        redirect_to root_path, notice: "お問い合わせを送信しました。"
        else
# バリデーションエラー時はフォームを再表示
            flash.now[:alert] = "入力に問題があります。"
            render :new, status: :unprocessable_entity
        end
    end

private

# Strong Parameters
    def contact_params
        params.require(:contact).permit(:name, :email, :message)
    end
end
