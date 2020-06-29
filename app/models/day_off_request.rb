class DayOffRequest < ApplicationRecord

  validates :reason, presence:  { message: "must be given please" }

end
