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



  # ...他のIDも同様
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
