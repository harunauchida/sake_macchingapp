require 'rails_helper'

RSpec.describe "日本酒一覧ページ", type: :system do
    before do
        Sake.create!(name: "獺祭", description: "フルーティで華やか")
    end

    it "日本酒一覧が表示される" do
        visit sakes_path
        expect(page).to have_content("獺祭")
    end
end
