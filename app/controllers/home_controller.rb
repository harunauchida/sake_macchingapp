# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    @sakes = Sake.all.limit(6)  # とりあえず最新6件だけ表示
  end
end
