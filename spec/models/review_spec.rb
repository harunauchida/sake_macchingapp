require 'rails_helper'

RSpec.describe "レビュー投稿", type: :system do
    let(:user) { User.create!(name: "テスト", email: "test@example.com", password: "password") }
    let(:sake) { Sake.create!(name: "黒龍", description: "バランスが良い") }

    before do
            driven_by :headless_chrome, using: :selenium, screen_size: [1400, 1400]
    end

    it "ログイン後にレビューを投稿できる" do
        # ログイン
        visit login_path
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: "password"
        click_button "ログイン"

        # 日本酒ページへ
        visit sake_path(sake)

        # 星評価を選択
        select "5", from: "評価（1〜5）"

        # コメント入力
        fill_in "コメント", with: "とても美味しい"

        # 投稿ボタンをクリック
        click_button "投稿"

        # 投稿後の確認
        expect(page).to have_content("レビューが投稿されました")
        expect(page).to have_content("とても美味しい")
        expect(page).to have_content("★5")
    end
end
