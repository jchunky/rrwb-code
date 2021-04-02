module Template
  def template(template, req_id)
    code = req_id
    altcode = "#{code[0..4]}-#{code[5..7]}"

    template
      .gsub("%CODE%", code)
      .gsub("%ALTCODE%", altcode)
  end
end
