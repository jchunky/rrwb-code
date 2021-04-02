module Template
  def template(source_template, req_id)
    template = String.new(source_template)

    # Substitute for %CODE%
    template_split_begin = template.index("%CODE%")
    template_split_end = template_split_begin + 6
    template_part_one = String.new(template[0..(template_split_begin - 1)])
    template_part_two = String.new(template[template_split_end..template.length])
    code = String.new(req_id)
    altcode = "#{code[0..4]}-#{code[5..7]}"

    template
      .gsub("%CODE%", code)
      .gsub("%ALTCODE%", altcode)
  end
end
