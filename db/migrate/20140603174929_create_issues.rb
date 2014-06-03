class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.string :description
      t.string :state
      t.string :resolution
      t.integer :thermostat_id

      t.timestamps
    end
  end
end
