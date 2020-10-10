class AddIndexToShorthenedUrls < ActiveRecord::Migration[5.2]
  def change
    add_index :shorthened_urls, :user_id
  end
end
