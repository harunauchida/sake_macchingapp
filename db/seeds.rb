# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Sake.destroy_all  # 既存データをクリア（必要に応じて）

Sake.create!([
  {
    name: "獺祭 純米大吟醸",
    description: "フルーティで飲みやすい初心者向けの日本酒。",
    image: "https://example.com/dassai.jpg"
  },
  {
    name: "八海山 特別純米",
    description: "すっきりとした辛口で、和食にぴったり。",
    image: "https://example.com/hakkaisan.jpg"
  },
  {
    name: "黒龍 いっちょらい",
    description: "濃厚な味わいと深い香りが特徴。",
    image: "https://example.com/kokuryu.jpg"
  },
  {
    name: "久保田 千寿",
    description: "軽やかで飲みやすい、バランスの良い日本酒。",
    image: "https://example.com/kubota.jpg"
  },
  {
    name: "田酒 特別純米",
    description: "米の旨味が感じられる、やや甘口の日本酒。",
    image: "https://example.com/denshu.jpg"
  },
  {
    name: "十四代 本丸",
    description: "希少価値の高いプレミアムな日本酒。",
    image: "https://example.com/juyondai.jpg"
  }
])