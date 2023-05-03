class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.belongs_to :servicemen
      t.belongs_to :users
      t.string :description
      t.string :photo
      t.string :category
      t.string :service_comment
      t.string :status
      t.timestamps
    end
  end
end
