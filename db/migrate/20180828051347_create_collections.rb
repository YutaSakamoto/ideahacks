class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.string :title
      t.string :description
      t.string :image
      t.references :user, foreign_key: true
      t.references :idea_declear, foreign_key: true

      t.timestamps
    end
  end
end
