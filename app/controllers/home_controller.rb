class HomeController < ApplicationController
  def index
    @all_sakes = Sake.limit(6).map do |s|
      {
        "id" => s.id,
        "name" => s.name,
        "description" => s.description,
        "image" => s.image,        # 文字列として渡す（例: "/images/kubota.jpg"）
        "flavor_type" => s.flavor_type
      }
    end
  end
end
