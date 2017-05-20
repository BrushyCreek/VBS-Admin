module KidsHelper
  def grade_types
    ["Pre-K", "4k", "5k", "1st", "2nd", "3rd", "4th", "5th", "6th"]
  end

  def current_grade(last_grade_id)
    last_grade_id ||=0
    lg = last_grade_id
    if lg == 8
      return "7th"
    else
      return grade_types.at(lg + 1)
    end
  end
end
