prawn_document() do |pdf|
  pdf.font "Courier"
  @guardians.sort_last_name.each do |p|
    pdf.text "#{p.full_name} - #{sanitize p.phone}"
  end
end
