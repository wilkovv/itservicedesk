class CreateServicemen < ActiveRecord::Migration[7.0]
  def change
    create_table :servicemen do |t|
      t.string :name
      t.string :surname
      t.string :category

      t.timestamps
    end
  end
end
