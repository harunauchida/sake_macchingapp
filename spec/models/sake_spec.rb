require 'rails_helper'

RSpec.describe Sake, type: :model do
    it "名前と説明があれば有効" do
        sake = Sake.new(name: "獺祭", description: "華やかでフルーティな香り")
        expect(sake).to be_valid
    end

    it "名前がなければ無効" do
        sake = Sake.new(name: nil, description: "香りが良い")
        expect(sake).not_to be_valid
    end
end
