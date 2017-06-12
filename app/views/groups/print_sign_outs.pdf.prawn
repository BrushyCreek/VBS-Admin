prawn_document do |pdf|
  pdf.font "Courier"
  @groups.sort_by_grade.sort_by_name.each do |group|
    pdf.formatted_text [ { :text => "Class: ", :size => 15}, { :text => "#{group.name.upcase}", :size => 15, :styles => [:bold]}
                       ]
    pdf.horizontal_rule
    pdf.stroke
    pdf.move_down 20
    pdf.column_box([0,pdf.cursor], :columns => 2, :width => pdf.bounds.width) do
      group.kids.sort_by_last_name.each do |kid|
        pdf.font_size 9
          pdf.text kid.full_name, :style => :bold
          pdf.move_down 5
          pdf.text "  #{kid.parent_name} _________"
          pdf.move_down 5
          pdf.text "  #{kid.pickupper_1_name} _________"
          pdf.move_down 5
          pdf.text "  #{kid.pickupper_2_name} _________"
          pdf.move_down 5
          pdf.text "  #{kid.pickupper_3_name} _________"
          pdf.move_down 10
      end
    end
    pdf.start_new_page
  end
end
