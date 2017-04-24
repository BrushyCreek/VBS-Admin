module ApplicationHelper
  def find_age(birthdate)
    now = Time.now.utc.to_date
    now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
  end
  def pretty_print_date(date)
    date.strftime("%d/%m/%Y")
  end
  
end
