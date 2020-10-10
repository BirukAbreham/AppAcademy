class CreateTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.integer :shorthened_urls_id, null: false
      t.integer :tag_topics_id, null: false
      
      t.timestamps
    end
  end
end
