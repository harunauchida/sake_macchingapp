module ApplicationHelper
    def asset_exists?(path)
        Rails.application.assets.find_asset(path).present?
    rescue
        false
    end
end
