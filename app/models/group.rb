class Group < ApplicationRecord
  has_many :kids, dependent: :nullify
  has_many :volunteers, as: :leader, dependent: :nullify

  scope :sort_by_name, -> { order(name: :asc) }
  scope :sort_by_grade, -> { order(grade_id: :asc) }

  @@grades = ["Pre-K", "4k", "5k", "1st", "2nd", "3rd", "4th", "5th", "6th & 7th"]
  
  def name_grade
    "#{@@grades[grade_id]} - #{name}"
  end

  def name_grade_count
    "#{@@grades[grade_id]} - #{name} | #{kids.count}"
  end
end
