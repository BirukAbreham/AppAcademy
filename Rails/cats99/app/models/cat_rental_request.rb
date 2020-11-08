# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CatRentalRequest < ApplicationRecord

  belongs_to(
    :requested_cat,
    class_name: :Cat,
    foreign_key: :cat_id,
    primary_key: :id
  )

  def overlapping_requests
    overlapped = CatRentalRequest
                  .where(cat_id: cat_id)
                  .where('start_date = :starts OR start_date = :ends OR start_date BETWEEN :starts_btn AND :ends_btn',
                    starts: start_date,
                    ends: end_date,
                    starts_btn: start_date,
                    ends_btn: end_date
                  )
    overlapped
  end

  def overlapping_approved_requests
    self.overlapping_requests.where(status: 'APPROVED')
  end

  private
  def does_not_overlap_approved_request
    if self.overlapping_approved_requests.exists?
      errors[:request_overlap] << 'Current request already overlaps with other requests'
    end
  end

  STATUS = [
    'PENDING',
    'APPROVED',
    'DENIED',
  ]

  validates :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: STATUS }
  validate :does_not_overlap_approved_request
  
end
