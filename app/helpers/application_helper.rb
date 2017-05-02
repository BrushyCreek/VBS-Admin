module ApplicationHelper
  def shirt_sizes
    ["Youth Small", "Youth Medium", "Youth Large","Small", "Medium","Large","XL", "XXL"]
  end
  
  def find_age(birthdate)
    now = Time.now.utc.to_date
    now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
  end
  
  def pretty_print_date(date)
    date.strftime("%m/%d/%Y")
  end

  def find_shirt_size(size_id)
    if size_id
      return shirt_sizes[size_id]
    else
      return "N/A"
    end
  end
  
end
