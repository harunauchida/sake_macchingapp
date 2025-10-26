class CreateTypeDiagnostics < ActiveRecord::Migration[6.1]
  def change
    create_table :type_diagnostics do |t|
      t.references :user, null: false, foreign_key: true
      t.string :result
      t.integer :score

      t.timestamps
    end
  end
end
