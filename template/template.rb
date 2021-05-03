module Template
  def template(source_template, req_id)
    code = String.new(req_id)
    altcode = "#{code[0..4]}-#{code[5..7]}"

    source_template
      .gsub("%CODE%", code)
      .gsub("%ALTCODE%", altcode)
  end
end
