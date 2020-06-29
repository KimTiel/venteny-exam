class DayOffRequest < ApplicationRecord

  belongs_to :user, class_name: "User"

  validates :reason, presence:  { message: "must be given please" }
  validates :day_off_date, uniqueness: { scope: [:user_id], message: "already exist on your dayoff schedule" }

  validate :validate_dayoff_on_year
  
  def validate_dayoff_on_year
    dayoff_year = Dayoff.where(:year => self.day_off_date.year).first
    if (dayoff_year.blank?)
      errors.add(:day_off_date, "No available number dayoff for #{self.day_off_date.year}")
    else 
      total_dayoff = DayOffRequest.where("user_id = ? and day_off_date > ? AND day_off_date < ? and approve = ?", self.user_id, (Date::new(self.day_off_date.year,01,01).beginning_of_year), (Date::new(self.day_off_date.year,01,01).end_of_year), true)
      if(total_dayoff.count > dayoff_year.year)
        errors.add(:day_off_date, "has already exceed number of day off on year #{self.day_off_date.year}")
      end
    end
  end
end
