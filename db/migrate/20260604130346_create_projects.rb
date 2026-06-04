class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :architect
      t.string :category
      t.string :image_url
      t.integer :position
      t.boolean :featured

      t.timestamps
    end
  end
end
