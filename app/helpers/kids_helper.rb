module KidsHelper
  def grade_types
    ["Pre-K", "Pre-K", "4k", "5k", "1st", "2nd", "3rd", "4th", "5th", "6th"]
  end
  
  def current_grade(last_grade_id)
    lg = last_grade_id
    ng = grade_types[lg + 1]
    return ng
  end
end
