# 日本酒のデータを作成
Sake.create!([
  {
    name: "久保田 千寿",
    description: "新潟を代表する淡麗辛口の日本酒。キレのある味わいが特徴。",
    flavor_type: "dry",
    image: "kubota.jpg"
  },
  {
    name: "田酒 特別純米",
    description: "米の旨みをしっかり感じられる特別純米酒。バランスの取れた中口。",
    flavor_type: "medium",
    image: "denshu.jpg"
  },
  {
    name: "十四代 本丸",
    description: "フルーティーで上品な香りが楽しめる人気の銘柄。",
    flavor_type: "sweet",
    image: "jyuyondai.jpg"
  },
  {
    name: "八海山 特別本醸造",
    description: "スッキリとした飲み口で食中酒としても最適。",
    flavor_type: "dry",
    image: "hakkaisan.jpg"
  },
  {
    name: "越乃寒梅 白ラベル",
    description: "新潟の淡麗辛口を代表する上品な味わい。",
    flavor_type: "medium",
    image: "koshinokanbai.jpg"
  },
  {
    name: "浦霞 純米",
    description: "ふくらみのある旨味とキレの良い後味が魅力。",
    flavor_type: "sweet",
    image: "urakasumi.jpg"
  }
])

puts "日本酒データを登録しました！"
