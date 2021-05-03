#! /usr/bin/ruby
#
# Usage:
#
# timelog [--user USERNAME] [[--date d] [--hours] hrs] project
#

require "ostruct"
require "optparse"
require "optparse/date"

TIMELOG_FOLDER = ENV["TL_DIR"] || "/var/log/timelog"
TIMELOG_FILE_NAME = "timelog.txt"
TIMELOG_FILE = "#{TIMELOG_FOLDER}/#{TIMELOG_FILE_NAME}"

class Record < Struct.new(:project, :user, :date, :hours)
end

module TimelogRepository
  extend self

  def self.read
    IO.readlines(TIMELOG_FILE).map do |record|
      Record.new(record.split(/,/))
    end
  end

  def self.add(record)
    File.open(TIMELOG_FILE, "a+") do |f|
      f.puts "#{record.project},#{record.user},#{record.date},#{record.hours}"
    end
  end
end

class Timelog
  def main(args)
    options = parse_options(args)
    p "a" * 80
    p args
    p options
    p options.hours
    if options.hours
      log(options)
    else
      puts report(options)
    end
  end

  private

  def parse_options(argv)
    options = OpenStruct.new
    OptionParser.new do |opts|
      opts.banner = "Usage: #{$PROGRAM_NAME} [options] project_name"

      opts.on("-d", "--date DATE", Date, "Specify the date on which hours were worked") do |d|
        options.date = d
      end
      opts.on("-h", "--hours NUM", Float, "The number of hours worked") do |hrs|
        options.hours = hrs
      end
      opts.on("-u", "--user USERNAME", String, "Log time for a different user") do |user|
        options.user = user
      end
      opts.on_tail("-?", "--help", "Show this message") do
        puts opts
        exit
      end
    end.parse!

    if argv.empty?
      puts "Usage: #{$PROGRAM_NAME} [options] project_name"
      exit
    end

    if argv.length == 2
      hours = argv.shift
      options.hours = hours.to_f
    end

    raise(OptionParser::InvalidArgument, hours) if options.hours && options.hours <= 0.0

    options.project = argv[0]
    options
  end

  def report(options)
    records = TimelogRepository.read
    p "x" * 80
    p records
    records = records.select { |record| record.project == options.project }
    records = records.select { |record| record.user == options.user } if options.user
    months = Hash.new(0.0)
    total = 0.0
    records.each do |record|
      total += record.hours.to_f
      y, m, _d = record.date.split(/-/)
      months["#{y}-#{m}"] += record.hours.to_f
    end
    lines = months.keys.sort.map do |month|
      format("%-7s %8.1f", month, months[month])
    end
    lines << format("Total   %8.1f", total)
    lines.join("\n")
  end

  def log(options)
    options.user ||= ENV["USERNAME"]
    options.date ||= Date.today.to_s
    TimelogRepository.add(options)
  end
end

Timelog.new.main(ARGV) if __FILE__ == $PROGRAM_NAME
