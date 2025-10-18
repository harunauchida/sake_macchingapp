class CreateTypeResults < ActiveRecord::Migration[6.1]
  def change
    create_table :type_results do |t|
      t.references :user, null: false, foreign_key: true
      t.string :sake_type

      t.timestamps
    end
  end
end
