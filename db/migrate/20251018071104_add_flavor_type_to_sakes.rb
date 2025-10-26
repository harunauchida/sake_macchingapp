class AddFlavorTypeToSakes < ActiveRecord::Migration[6.1]
  def change
    add_column :sakes, :flavor_type, :string
  end
end
