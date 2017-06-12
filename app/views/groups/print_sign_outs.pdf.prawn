prawn_document() do |pdf|
  pdf.font "Courier"
  @groups.sort_by_grade.sort_by_name.each do |group|
    pdf.float do
      pdf.formatted_text [ { :text => "Class Signouts: ", :size => 15}, { :text => "#{group.name.upcase}", :size => 15, :styles => [:bold]} ]
    end
    pdf.move_down 3
    pdf.text "#{DateTime.now.strftime("%B %d, %Y")}", :size => 8, :align => :right
    pdf.move_down 2
    pdf.horizontal_rule
    pdf.stroke
    pdf.move_down 20
    pdf.column_box([0,pdf.cursor], :columns => 2, :width => pdf.bounds.width) do
      group.kids.sort_by_last_name.each do |kid|
        pdf.font_size 9
        pdf.text kid.full_name, :style => :bold
        pdf.indent(10) do
          pdf.move_down 5
          pdf.text "  #{kid.parent_name} _________"
          pdf.move_down 5
	  if kid.pickupper_1_name.present?
            pdf.text "  #{kid.pickupper_1_name} _________"
            pdf.move_down 5
	  end
	  if kid.pickupper_2_name.present?
            pdf.text "  #{kid.pickupper_2_name} _________"
            pdf.move_down 5
          end
	  if kid.pickupper_3_name.present?
            pdf.text "  #{kid.pickupper_3_name} _________"
          end
        end
        pdf.move_down 10
      end
    end
    pdf.start_new_page
  end
end
