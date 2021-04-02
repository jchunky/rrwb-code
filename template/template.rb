module Template
  def template(template, code)
    alt_code = [code[0..4], code[5..7]].join("-")

    template
      .gsub("%CODE%", code)
      .gsub("%ALTCODE%", alt_code)
  end
end
