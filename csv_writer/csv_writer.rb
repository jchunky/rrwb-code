class CsvWriter < Struct.new(:out)
  def write(lines)
    out << render_lines(lines)
  end

  private

  def render_lines(lines)
    "#{lines.map(&method(:render_line)).join("\n")}\n"
  end

  def render_line(fields)
    fields.map(&method(:render_field)).join(",")
  end

  def render_field(field)
    field =~ /[,"]/ ? render_quoted(field) : field
  end

  def render_quoted(field)
    [
      '"',
      field.gsub('"', '""'),
      '"',
    ].join
  end
end
