class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :comment
      t.text :image
      t.timestamps
    end
  end
end
