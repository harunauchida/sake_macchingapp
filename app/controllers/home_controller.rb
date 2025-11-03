class HomeController < ApplicationController  
  def index
    @sweet_sakes  = Sake.where(flavor_type: 'sweet').limit(3)
    @medium_sakes = Sake.where(flavor_type: 'medium').limit(3)
    @dry_sakes    = Sake.where(flavor_type: 'dry').limit(3)

    @all_sakes = Sake.limit(3)

    Rails.logger.debug "Sweet: #{@sweet_sakes.map { |s| s.name }}"
    Rails.logger.debug "Medium: #{@medium_sakes.map { |s| s.name }}"
    Rails.logger.debug "Dry: #{@dry_sakes.map { |s| s.name }}"
  end
end
