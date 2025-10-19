Sake.destroy_all

sakes = [
  { name: '獺祭 純米大吟醸', description: 'フルーティで華やかな香り', file: 'db/seeds/images/dassai.png', flavor_type: 'sweet' },
  { name: '八海山 特別純米', description: 'すっきりした味わい', file: 'db/seeds/images/hakkaisan.png', flavor_type: 'medium' },
  { name: '黒龍 いっちょらい', description: '芳醇でコクのある味わい', file: 'db/seeds/images/kokuryu.png', flavor_type: 'dry' },
  { name: '久保田 千寿', description: '軽やかで飲みやすい、バランスの良い日本酒', file: 'db/seeds/images/senju.png', flavor_type: 'medium' },
  { name: '田酒 特別純米', description: '米の旨味が感じられる、やや甘口の日本酒', file: 'db/seeds/images/tasake.png', flavor_type: 'sweet' },
  { name: '十四代 本丸', description: '希少価値の高いプレミアムな日本酒', file: 'db/seeds/images/honmaru.png', flavor_type: 'dry' }
]

sakes.each do |s|
  sake = Sake.create!(
    name: s[:name],
    description: s[:description],
    flavor_type: s[:flavor_type]
  )
  # 画像が存在する場合のみ添付
  if File.exist?(Rails.root.join(s[:file]))
    sake.image.attach(io: File.open(Rails.root.join(s[:file])), filename: File.basename(s[:file]))
  else
    puts "画像ファイルが見つかりません: #{s[:file]}"
  end
end

puts "登録完了: #{Sake.count} 件"
