class Dayoff < ApplicationRecord
  validates :year, uniqueness: true, presence:  { message: "must be given please" }

  
end
