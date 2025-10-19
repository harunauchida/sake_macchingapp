Sake.destroy_all 

# トップページ用の日本酒
sakes = [
  { name: '獺祭 純米大吟醸', description: 'フルーティで華やかな香り', file: 'db/seeds/images/dassai.png', flavor_type: 'sweet' },
  { name: '八海山 特別純米', description: 'すっきりした味わい', file: 'db/seeds/images/hakkaisan.png', flavor_type: 'medium' },
  { name: '黒龍 いっちょらい', description: '芳醇でコクのある味わい', file: 'db/seeds/images/kokuryu.png', flavor_type: 'dry' },
  { name: '久保田 千寿', description: '軽やかで飲みやすい、バランスの良い日本酒', file: 'db/seeds/images/senju.png', flavor_type: 'medium' },
  { name: '田酒 特別純米', description: '米の旨味が感じられる、やや甘口の日本酒', file: 'db/seeds/images/tasake.png', flavor_type: 'sweet' },
  { name: '十四代 本丸', description: '希少価値の高いプレミアムな日本酒', file: 'db/seeds/images/honmaru.png', flavor_type: 'dry' }
]

# 日本酒作成メソッド
def create_sake(s)
  sake = Sake.create!(
    name: s[:name],
    description: s[:description],
    flavor_type: s[:flavor_type]
  )
  # 画像が存在すれば添付
  image_path = Rails.root.join(s[:file])
  if File.exist?(image_path)
    sake.image.attach(io: File.open(image_path), filename: File.basename(image_path))
    puts "登録完了: #{s[:name]}"
  else
    puts "⚠️ 画像ファイルが見つかりません: #{s[:file]}"
  end
end

# トップページ用を登録
sakes.each { |s| create_sake(s) }

# 日本酒一覧ページ用の追加データ
additional_sakes = [
  { name: '新政 No.6', description: '爽やかで軽やかな味わい', file: 'db/seeds/images/araimasa.png', flavor_type: 'dry' },
  { name: '而今 純米吟醸', description: 'フルーティで上品な香り', file: 'db/seeds/images/jikon.png', flavor_type: 'sweet' },
  { name: '秋鹿 純米吟醸', description: 'フルーティで軽やか、後味すっきり', file: 'db/seeds/images/akishika.png', flavor_type: 'medium' },
  { name: '天狗舞 山廃純米', description: 'コクがあり香り豊か', file: 'db/seeds/images/tengumai.png', flavor_type: 'dry' },
  { name: '黒松白鹿 本醸造', description: '軽やかで飲みやすい', file: 'db/seeds/images/kuromatsu.png', flavor_type: 'medium' },
  { name: '醸し人九平次 純米吟醸', description: '華やかでフルーティな味わい', file: 'db/seeds/images/kuheiji_junmai.png', flavor_type: 'sweet' },
  { name: '白瀑 純米吟醸', description: '爽やかでフルーティ、飲みやすい', file: 'db/seeds/images/shirataki.png', flavor_type: 'sweet' },
  { name: '而今 特別純米', description: '上品で芳醇な香り', file: 'db/seeds/images/jikon_tokubetsu.png', flavor_type: 'sweet' },
  { name: '雪の茅舎 純米吟醸', description: 'まろやかで優しい味わい', file: 'db/seeds/images/yukinobousha.png', flavor_type: 'medium' },
  { name: '新政 生成', description: 'フレッシュで爽やか、軽快な味わい', file: 'db/seeds/images/araimasa_seisei.png', flavor_type: 'dry' },
  { name: '南部美人 純米吟醸', description: '上品で飲みやすく芳醇', file: 'db/seeds/images/nanbu.png', flavor_type: 'medium' },
  { name: '黒龍 九頭龍', description: 'しっかりした辛口でコクのある味', file: 'db/seeds/images/kokuryu_kuzuryu.png', flavor_type: 'dry' }
]

# 追加データ登録（重複チェック付き）
additional_sakes.each do |s|
  next if Sake.exists?(name: s[:name])
  create_sake(s)
end

puts "🎉 登録完了: 合計 #{Sake.count} 件"
