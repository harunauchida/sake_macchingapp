sakes = [ 
  { id: 66, name: '獺祭 純米大吟醸', description: 'フルーティで華やかな香り', image_path: 'dassai.png', flavor_type: 'sweet' },
  { id: 67, name: '八海山 特別純米', description: 'スッキリとした味わい', image_path: 'hakkaisan.png', flavor_type: 'medium' },
  { id: 68, name: '黒龍 いっちょらい', description: '軽やかで飲みやすい', image_path: 'kokuryu_icchorai.jpg', flavor_type: 'dry' },
  { id: 69, name: '久保田 千寿', description: '米の旨味がしっかり', image_path: 'kubota_senju.png', flavor_type: 'medium' },
  { id: 70, name: 'たかちよ 純米', description: 'フルーティで軽やか', image_path: 'tasake_junmai.png', flavor_type: 'sweet' },
  { id: 71, name: '十四代 本丸', description: '濃厚で香り高い', image_path: 'juuyondai.png', flavor_type: 'dry' },
  { id: 72, name: '新政 No.6', description: '爽やかで軽快', image_path: 'shinsei.png', flavor_type: 'medium' },
  { id: 73, name: '地酒 純米', description: 'やや辛口で飲みやすい', image_path: 'jikon_junmmai.png', flavor_type: 'dry' },
  { id: 74, name: '秋鹿', description: 'コクがあり芳醇な味わい', image_path: 'akishika.png', flavor_type: 'dry' },
  { id: 75, name: '天狗舞 山廃純米', description: 'コクのある味わい', image_path: 'tengumai.png', flavor_type: 'medium' },
  { id: 76, name: '黒松 白鹿', description: '飲みやすい定番酒', image_path: 'kuromatu.png', flavor_type: 'medium' },
  { id: 77, name: '神亀 平成', description: '米の旨味がしっかり', image_path: 'jinkyuuheiji.png', flavor_type: 'medium' },
  { id: 78, name: '白岳 しらばく', description: 'やさしい味わい', image_path: 'shirabaku.png', flavor_type: 'sweet' },
  { id: 79, name: '地酒 特別純米', description: '香り高く軽やか', image_path: 'jikon_tokubetujunmai.png', flavor_type: 'medium' },
  { id: 80, name: '雪の宿 酒主', description: '甘みとコクのバランス良し', image_path: 'yukino_shukusha.png', flavor_type: 'sweet' },
  { id: 81, name: '新生清酒', description: '爽やかで軽快', image_path: 'shinseiseisi.png', flavor_type: 'medium' },
  { id: 82, name: '南部美人', description: '優しい味わい', image_path: 'nanbubijin.png', flavor_type: 'sweet' },
  { id: 83, name: '黒龍', description: '上品で飲みやすい', image_path: 'kuroryu.png', flavor_type: 'dry' }
]

Sake.where(id: sakes.map { |s| s[:id] }).destroy_all

# 新しいデータを作成
sakes.each do |s|
  Sake.create!(s)
end

puts "Created #{Sake.count} Sake records"
