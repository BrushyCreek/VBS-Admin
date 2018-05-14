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

  def grade_types
    ["Pre-K", "4k", "5k", "1st", "2nd", "3rd", "4th", "5th", "6th"]
  end

  def js(data)
    if data.respond_to? :to_json
      data.to_json
    else
      data.instect.to_json
    end
  end

  def add_object_button(name, source, tagert)
    button_tag(name, type: "button", class: "add-source")
   #.replace(/index_to_replace_with_js/g, new Date().getTime()));
  end

  def add_form_template(form, object, partial, id)
    html = form.fields_for :kids, object, :child_index => "index_to_replace_with_js" do |ff|
      render partial: "kids/kid_form", locals: {f:ff, admin: 0}
    end
    content_tag(:div, html, id: id, style: "display: none")
  end
end
