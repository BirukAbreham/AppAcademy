class TagTopic < ApplicationRecord
  validates :topic, presence: true, uniqueness: true

  has_many(
    :taggings,
    class_name: 'Tagging',
    foreign_key: :tag_topics_id,
    primary_key: :id
  )

  has_many(
    :urls,
    through: :taggings,
    source: :shorthened_urls
  )

  def popular_links
    all_tag_urls = self.urls
    top_link = {}
    all_tag_urls.each do |short_url|
      top_link[short_url.long_url] = short_url.num_clicks
    end
    return (top_link.sort_by { |short_url, count| count }.reverse).to_h
  end

end
