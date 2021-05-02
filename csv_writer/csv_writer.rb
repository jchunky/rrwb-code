class CsvWriter < Struct.new(:out)
  def write(lines)
    out << lines.map(&method(:render_line)).join("\n")
    out << "\n"
  end

  private

  def render_line(fields)
    fields.map(&method(:render_field)).join(",")
  end

  def render_field(field)
    field =~ /[,"]/ ? quoted(field) : field
  end

  def quoted(field)
    ['"', field.gsub(/"/, '""'), '"'].join
  end
end
