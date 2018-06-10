prawn_document() do |pdf|
  pdf.font "Helvetica"
  @guardians.sort_last_name.each do |p|
    pdf.text "#{p.full_name} - #{p.phone}"
  end
end
