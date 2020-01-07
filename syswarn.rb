#!/usr/bin/env ruby

exit if RUBY_PLATFORM !~ /linux/

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
  puts "\e[1;5;93mwArning\e[0m \e[1;33m:\e[0m"
  puts "\e[1;91m" + warning_info + "\e[0m"
end
