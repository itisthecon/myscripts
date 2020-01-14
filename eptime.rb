#!/usr/bin/env ruby

require 'optparse'
require 'date'

params = ARGV.getopts("d:")

unless params["d"].nil?
  puts DateTime.parse("#{params["d"]} +0800").to_datetime.to_time.to_i
  puts params["d"]
end

puts Time.now.to_i
puts Time.now.to_s
