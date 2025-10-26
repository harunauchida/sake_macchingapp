class CreateSakes < ActiveRecord::Migration[6.1]
  def change
    create_table :sakes do |t|
      t.string :name
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
