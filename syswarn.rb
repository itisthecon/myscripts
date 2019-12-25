#!/usr/bin/env ruby
require 'colorize'

DISKWARN = 75.0

warning_info = ""

meminfo = %x(free)
swap_total = meminfo.split(" ")[14].to_f
swap_used = meminfo.split(" ")[15].to_f
if swap_used > 0
  swap_percent = (swap_used / swap_total * 100).round(2)
  warning_info = "sWap used ...................................... #{swap_percent}%"
end

dfinfo = %x(df -h /| sed s/%//g)
diskused = dfinfo.split(" ")[10].to_f
if diskused > DISKWARN
  warning_info += "\n" unless warning_info.empty?
  warning_info += "/ used    ...................................... #{diskused}%"
end

unless warning_info.empty?
  puts "wArning :".colorize(:color => :yellow,:mode => :bold)
  puts warning_info.colorize(:color => :red,:mode => :bold)
end
