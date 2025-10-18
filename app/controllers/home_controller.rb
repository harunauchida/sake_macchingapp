# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    @sakes = Sake.limit(6)  
  end
end
