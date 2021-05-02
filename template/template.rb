module Template
  def template(source_template, req_id)
    code = req_id
    altcode = [code[0..4], code[5..7]].join("-")

    source_template
      .gsub("%CODE%", code)
      .gsub("%ALTCODE%", altcode)
  end
end
