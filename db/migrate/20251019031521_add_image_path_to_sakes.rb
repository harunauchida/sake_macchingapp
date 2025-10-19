class AddImagePathToSakes < ActiveRecord::Migration[6.1]
  def change
    add_column :sakes, :image_path, :string
  end
end
