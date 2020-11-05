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

  def age
    time_ago_in_words(Time.now - self.birth_date)
  end

end
