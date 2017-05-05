class Group < ApplicationRecord
  has_many :kids
  has_many :volunteers, as: :leader

  def name_grade
    grades = ["Pre-K", "4k", "5k", "1st", "2nd", "3rd", "4th", "5th", "6th"]

    "#{grades[grade_id]} - #{name}"
  end
end
