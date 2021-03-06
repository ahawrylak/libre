class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :author
      t.string :title
      t.integer :pub_year
      t.text :description, default: "No description"

      t.timestamps
    end
  end
end
