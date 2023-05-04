class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.belongs_to :servicemen, null: false, foreign_key: true
      t.belongs_to :users, null: false, foreign_key: true
      t.string :description
      t.string :photo
      t.string :category
      t.string :service_comment
      t.string :status_string

      t.timestamps
    end
  end
end