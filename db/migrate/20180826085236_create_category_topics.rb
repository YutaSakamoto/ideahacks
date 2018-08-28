class CreateCategoryTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :category_topics do |t|
      t.references :topic, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
