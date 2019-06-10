prawn_document() do |pdf|
  pdf.font "Courier"
  @groups.sort_by_grade.sort_by_name.each do |group|
    pdf.float do
      pdf.formatted_text [ { :text => "Class Signouts: ", :size => 15}, { :text => "#{group.name_grade}", :size => 15, :styles => [:bold]} ]
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
          pdf.move_down 5
	  kid.family.guardians.each do | g |
            pdf.text "  #{g.full_name} _________"
            pdf.move_down 5
	  end
        end
        pdf.move_down 10
      end
    end
    pdf.start_new_page
  end
end
