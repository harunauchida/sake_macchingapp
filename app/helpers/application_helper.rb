module ApplicationHelper
    def asset_exists?(path)
        if Rails.application.assets_manifest
            Rails.application.assets_manifest.assets[path].present?
        else
            Rails.application.assets.find_asset(path).present?
        end
    end
end
