require 'rails_helper'

RSpec.describe "レビュー投稿", type: :system do
    let(:user) { User.create!(name: "テスト", email: "test@example.com", password: "password") }
    let(:sake) { Sake.create!(name: "黒龍", description: "バランスが良い") }

    before do
        driven_by :headless_chrome, using: :selenium, screen_size: [1400, 1400]
    end

    it "ログイン後にレビューを投稿できる" do
        visit login_path
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: "password"
        click_button "ログイン"

        visit sake_path(sake)
        select "5", from: "評価（1〜5）"
        fill_in "コメント", with: "とても美味しい"
        click_button "投稿"

        expect(page).to have_content("とても美味しい")
    end
end
