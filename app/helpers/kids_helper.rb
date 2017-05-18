module KidsHelper
  def grade_types
    ["Pre-K", "4k", "5k", "1st", "2nd", "3rd", "4th", "5th", "6th"]
  end

 def state_names
  %w(Alaska Alabama Arkansas American\ Samoa Arizona California Colorado Connecticut District\ of\ Columbia Delaware Florida Georgia Guam Hawaii Iowa Idaho Illinois Indiana Kansas Kentucky Louisiana Massachusetts Maryland Maine Michigan Minnesota Missouri Mississippi Montana North\ Carolina North\ Dakota Nebraska New\ Hampshire New\ Jersey New\ Mexico Nevada New\ York Ohio Oklahoma Oregon Pennsylvania Puerto\ Rico Rhode\ Island South\ Carolina South\ Dakota Tennessee Texas Utah Virginia Virgin\ Islands Vermont Washington Wisconsin West\ Virginia Wyoming)
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
