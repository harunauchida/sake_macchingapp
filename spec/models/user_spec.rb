require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前・メール・パスワードがあれば有効" do
    user = User.new(name: "テスト", email: "test@example.com", password: "password")
    expect(user).to be_valid
  end

  it "名前がなければ無効" do
    user = User.new(name: nil, email: "test@example.com", password: "password")
    expect(user).not_to be_valid
  end

  it "メールがなければ無効" do
    user = User.new(name: "テスト", email: nil, password: "password")
    expect(user).not_to be_valid
  end

  it "メールが重複していたら無効" do
    User.create!(name: "A", email: "test@example.com", password: "password")
    user = User.new(name: "B", email: "test@example.com", password: "password")
    expect(user).not_to be_valid
  end
end
