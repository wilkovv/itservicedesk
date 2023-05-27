class AddTitleToIssues < ActiveRecord::Migration[7.0]
  def change
    add_column :issues, :title, :string
  end
end
