class AddNewValuesToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :state, :string, :default => "ABIERTO", :null => false
    add_column :issues, :resolution, :string, :default => "", :null => false
  end
end
