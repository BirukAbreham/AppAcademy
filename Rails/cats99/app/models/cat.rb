# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'

class Cat < ApplicationRecord
  
  STANDARD_COLOR = [
    'red',
    'orange',
    'yellow',
    'green',
    'blue',
    'indigo',
    'violet',
  ]

  SEX = [ 'M', 'F' ]

  include ActionView::Helpers::DateHelper

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: STANDARD_COLOR }
  validates :sex, inclusion: { in: SEX }

  has_many(
    :rental_request,
    dependent: :destroy,
    class_name: :CatRentalRequest,
    foreign_key: :cat_id,
    primary_key: :id
  )

  def age
    time_ago_in_words(Time.now - self.birth_date)
  end

end
