#!/usr/bin/env ruby

require 'optparse'
require 'date'

params = ARGV.getopts("d:")

unless params["d"].nil?
  puts DateTime.parse("#{params["d"]} #{Time.now.strftime("%z")}").to_datetime.to_time.to_i
  puts params["d"]
end

unless ARGV[0].empty?
  puts ARGV[0]
  puts Time.at(ARGV[0].to_i).to_s
end

puts Time.now.to_i
puts Time.now.to_s
