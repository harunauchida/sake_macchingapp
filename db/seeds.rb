sakes = [
  { id: 66, name: '獺祭 純米大吟醸', description: 'フルーティで華やかな香り' },
  { id: 67, name: '八海山 特別純米', description: 'スッキリとした味わい' },
  { id: 68, name: '黒龍 いっちょらい', description: '軽やかで飲みやすい' },
  { id: 69, name: '久保田 千寿', description: '米の旨味がしっかり' },
  { id: 70, name: 'たかちよ 純米', description: 'フルーティで軽やか' },
  { id: 71, name: '十四代 本丸', description: '濃厚で香り高い' },
  { id: 72, name: '新政 No.6', description: '爽やかで軽快' },
  { id: 73, name: '地酒 純米', description: 'やや辛口で飲みやすい' },
  { id: 74, name: '秋鹿', description: 'コクがあり芳醇な味わい' },
  { id: 75, name: '天狗舞 山廃純米', description: 'コクのある味わい' },
  { id: 76, name: '黒松 白鹿', description: '飲みやすい定番酒' },
  { id: 77, name: '神亀 平成', description: '米の旨味がしっかり' },
  { id: 78, name: '白岳 しらばく', description: 'やさしい味わい' },
  { id: 79, name: '地酒 特別純米', description: '香り高く軽やか' },
  { id: 80, name: '雪の宿 酒主', description: '甘みとコクのバランス良し' },
  { id: 81, name: '新生清酒', description: '爽やかで軽快' },
  { id: 82, name: '南部美人', description: '優しい味わい' },
  { id: 83, name: '黒龍', description: '上品で飲みやすい' },
]


Sake.where(id: sakes.map { |s| s[:id] }).destroy_all


sakes.each do |s|
  Sake.create!(s)
end

puts "Created #{Sake.count} Sake records"


sake_images = { 
  66 => "dassai.png",
  67 => "hakkaisan.png",
  68 => "kokuryu_icchorai.jpg",
  69 => "kubota_senju.png",
  70 => "tasake_junmai.png",
  71 => "juuyondai.png",
  72 => "shinsei.png",
  73 => "jikon_junmmai.png",
  74 => "akishika.png",
  75 => "tengumai.png",
  76 => "kuromatu.png",
  77 => "jinkyuuheiji.png",
  78 => "shirabaku.png",
  79 => "jikon_tokubetujunmai.png",
  80 => "yukino_shukusha.png",
  81 => "shinseiseisi.png",
  82 => "nanbubijin.png",
  83 => "kuroryu.png",
}

sake_images.each do |id, filename|
  sake = Sake.find_by(id: id)
  next unless sake

  file_path = Rails.root.join("app/assets/images/sakes/#{filename}")
  if File.exist?(file_path)
    sake.image.attach(
      io: File.open(file_path),
      filename: filename,
      content_type: "image/png"
    )
    puts "Attached image for #{sake.name}"
  else
    puts "File not found: #{filename}"
  end
end
