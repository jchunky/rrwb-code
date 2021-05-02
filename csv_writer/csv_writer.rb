class CsvWriter
  def write(lines)
    puts render_lines(lines)
  end

  def render_lines(lines)
    lines.map(&method(:render_line)).join("\n")
  end

  private

  def render_line(fields)
    fields.map(&method(:render_field)).join(",")
  end

  def render_field(field)
    field =~ /[,"]/ ? quoted(field) : field
  end

  def quoted(field)
    [
      "\"",
      field.gsub(/"/, "\"\""),
      "\"",
    ].join
  end
end
