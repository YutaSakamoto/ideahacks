class CreateDeclears < ActiveRecord::Migration[5.2]
  def change
    create_table :declears do |t|
      t.string :comment
      t.string :image
      t.references :user, foreign_key: true
      t.references :collection, foreign_key: true

      t.timestamps
    end
  end
end
