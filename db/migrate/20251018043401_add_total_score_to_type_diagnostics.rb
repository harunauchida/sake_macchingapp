class AddTotalScoreToTypeDiagnostics < ActiveRecord::Migration[6.1]
  def change
    add_column :type_diagnostics, :total_score, :integer
  end
end
