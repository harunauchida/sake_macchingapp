require 'rails_helper'

RSpec.describe "ログイン機能", type: :system do
  let(:user) { User.create!(name: "テストユーザー", email: "test@example.com", password: "password") }

  before do
    driven_by :headless_chrome, using: :selenium, screen_size: [1400, 1400]
  end

  it "ユーザーがログイン後トップページにリダイレクトされること" do
    visit login_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: "password"
    click_button "ログイン"

    # ログイン後、トップページにリダイレクトされているか確認
    expect(current_path).to eq(root_path)

    # トップページにユーザー名や案内文が表示されているか確認
    expect(page).to have_content(user.name)
    expect(page).to have_content("ようこそ、SAKE MATCHへ")
  end
end
