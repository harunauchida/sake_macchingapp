class HomeController < ApplicationController 
  def index
    @all_sakes = Sake.limit(3)
    Rails.logger.debug @all_sakes.map { |s| { name: s.name, image_path: s.image_path } }
  end
end
