class CreateProjectImages < ActiveRecord::Migration[7.2]
  def change
    create_table :project_images do |t|
      t.references :project, null: false, foreign_key: true
      t.string :image_url
      t.integer :position

      t.timestamps
    end
  end
end
