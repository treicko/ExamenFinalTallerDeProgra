class RemoveDatosStateResolutionFromIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :state, :string
    remove_column :issues, :resolution, :string
  end
end
