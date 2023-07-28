class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  validates :schedule_memo, length: { maximum: 500 }

  def end_date_after_start_date
    return unless start_date && end_date

    if end_date < start_date
      errors.add(:end_date, 'must be after start date')
    elsif end_date < Date.today
      errors.add(:end_date, 'cannot be in the past')
    end
  end
end

