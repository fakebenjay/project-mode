class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :category_id
      t.string :description

      t.timestamps
    end
  end
end
