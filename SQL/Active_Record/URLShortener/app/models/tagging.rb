class Tagging < ApplicationRecord
  validates :shorthened_urls_id, :tag_topics_id, presence: true

  belongs_to(
    :shorthened_urls,
    class_name: 'ShorthenedUrl',
    foreign_key: :shorthened_urls_id,
    primary_key: :id
  )

  belongs_to(
    :tag_topics,
    class_name: 'TagTopic',
    foreign_key: :tag_topics_id,
    primary_key: :id
  )

  def self.record_tagging!(shorthened_url, tag_topic)
    Tagging.create!(
      shorthened_urls_id: shorthened_url.id,
      tag_topics_id: tag_topic.id
    )
  end

end
