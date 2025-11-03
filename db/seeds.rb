sakes = [
  { id: 66, name: '獺祭 純米大吟醸', description: 'フルーティで華やかな香り', image_path: 'dassai.png' },
  { id: 67, name: '八海山 特別純米', description: 'スッキリとした味わい', image_path: 'hakkaisan.png' },
  { id: 68, name: '黒龍 いっちょらい', description: '軽やかで飲みやすい', image_path: 'kokuryu_icchorai.jpg' },
  { id: 69, name: '久保田 千寿', description: '米の旨味がしっかり', image_path: 'kubota_senju.png' },
  { id: 70, name: 'たかちよ 純米', description: 'フルーティで軽やか', image_path: 'tasake_junmai.png' },
  { id: 71, name: '十四代 本丸', description: '濃厚で香り高い', image_path: 'juuyondai.png' },
  { id: 72, name: '新政 No.6', description: '爽やかで軽快', image_path: 'shinsei.png' },
  { id: 73, name: '地酒 純米', description: 'やや辛口で飲みやすい', image_path: 'jikon_junmmai.png' },
  { id: 74, name: '秋鹿', description: 'コクがあり芳醇な味わい', image_path: 'akishika.png' },
  { id: 75, name: '天狗舞 山廃純米', description: 'コクのある味わい', image_path: 'tengumai.png' },
  { id: 76, name: '黒松 白鹿', description: '飲みやすい定番酒', image_path: 'kuromatu.png' },
  { id: 77, name: '神亀 平成', description: '米の旨味がしっかり', image_path: 'jinkyuuheiji.png' },
  { id: 78, name: '白岳 しらばく', description: 'やさしい味わい', image_path: 'shirabaku.png' },
  { id: 79, name: '地酒 特別純米', description: '香り高く軽やか', image_path: 'jikon_tokubetujunmai.png' },
  { id: 80, name: '雪の宿 酒主', description: '甘みとコクのバランス良し', image_path: 'yukino_shukusha.png' },
  { id: 81, name: '新生清酒', description: '爽やかで軽快', image_path: 'shinseiseisi.png' },
  { id: 82, name: '南部美人', description: '優しい味わい', image_path: 'nanbubijin.png' },
  { id: 83, name: '黒龍', description: '上品で飲みやすい', image_path: 'kuroryu.png' }
]


Sake.where(id: sakes.map { |s| s[:id] }).destroy_all


sakes.each do |s|
  Sake.create!(s)
end

puts "Created #{Sake.count} Sake records"
