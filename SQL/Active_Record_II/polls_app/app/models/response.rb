# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Response < ApplicationRecord

  belongs_to(
    :answer_choice,
    class_name: :AnswerChoice,
    foreign_key: :answer_choice_id,
    primary_key: :id
  )

  belongs_to(
    :respondent,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  def sibling_responses
    new_response = Response.new(user_id: user_id, answer_choice_id: answer_choice_id)
    sibling_response = new_response.question.responses.where.not('answer_choice_id = ?', answer_choice_id)
    sibling_response
  end

  def respondent_already_answered?
    all_sibling_response = self.sibling_responses
    all_sibling_response.each do |res|
      return true if res.user_id == user_id
    end
    false
  end

  def polls_author_is_user?
    new_response = Response.new(user_id: user_id, answer_choice_id: answer_choice_id)
    user_response_id = new_response.question.poll.user_id
    return true if user_response_id == user_id
    false
  end

  private
  def not_duplicate_response
    if self.respondent_already_answered?
      errors[:duplicate_response] << 'User already gave a response for the question'
    end
  end

  private
  def author_cannot_respond_to_own_poll
    if self.polls_author_is_user?
      errors[:author_cannot_respond_to_own_poll] << "because he/she is the author of the poll"
    end
  end

  validate :not_duplicate_response, :author_cannot_respond_to_own_poll

end
