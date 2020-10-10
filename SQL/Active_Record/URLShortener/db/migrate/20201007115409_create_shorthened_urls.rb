class CreateShorthenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shorthened_urls do |t|
      t.string :long_url
      t.string :short_url
      t.integer :user_id
      t.timestamps
    end
  end
end
