# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  question   :text             not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Question < ApplicationRecord

  validates :question, presence: true

  belongs_to(
    :poll,
    class_name: :Poll,
    foreign_key: :poll_id,
    primary_key: :id
  )

  has_many(
    :answer_choices,
    class_name: :AnswerChoice,
    foreign_key: :question_id,
    primary_key: :id
  )

  has_many(
    :responses,
    through: :answer_choices,
    source: :responses
  )

  # Not at all efficient
  def n_plus_one_result
    poll_result = {}

    all_answer = self.answer_choices
    all_answer.each do |ans|
      poll_result[ans.choice] = ans.responses.count
    end

    poll_result
  end

  # Some how efficient, but it uses a lot 
  # of memory (queries data which is not important)
  def result_includes
    poll_result = {}

    answers = self.answer_choices.includes(:responses)
    answers.each do |ans|
      poll_result[ans.choice] = ans.responses.length
    end

    poll_result
  end

  def result
    poll_result = {}

    answer = self.answer_choices
    res = answer
            .left_outer_joins(:responses)
            .group('answer_choices.choice')
            .select('answer_choices.choice, COUNT(responses.answer_choice_id) AS count')
    res.each do |ans|
      poll_result[ans.choice] = ans.count
    end

    poll_result
  end

end
