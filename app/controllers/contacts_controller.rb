class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end

    def create
        @contact = Contact.new(contact_params)
        if @contact.valid?  
            redirect_to root_path, notice: "お問い合わせを送信しました。"
        else
            flash.now[:alert] = "入力に問題があります。"
            render :new, status: :unprocessable_entity
        end
    end

    private

    def contact_params
        params.require(:contact).permit(:name, :email, :message)
    end
end
