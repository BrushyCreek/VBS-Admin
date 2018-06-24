prawn_document() do |pdf|
  pdf.font "Courier"
  pdf.formatted_text [ { :text => "All Guest Kids", :size => 15, :styles => [:bold]} ]
  pdf.move_down 2
  pdf.horizontal_rule
  pdf.move_down 20
  pdf.font_size 9
  pdf.column_box([0,pdf.cursor], :columns => 2, :width => pdf.bounds.width) do
    @kids.sort_by_grade.sort_by_last_name.each do | kid |
      pdf.text "#{kid.full_name}", :align => :left, :style => :bold
      pdf.indent(10) do
        pdf.move_down 5
        pdf.text kid.family.head.full_name, :align => :left
        pdf.text kid.family.head.address, :align => :left
        pdf.text "#{kid.family.head.city}, #{kid.family.head.state} #{kid.family.head.zipcode}", :align => :left
      end
      pdf.move_down 10
    end
  end
end
